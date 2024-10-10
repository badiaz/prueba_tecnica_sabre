import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_zone_app/domain/entities/time_entity.dart';
import 'package:time_zone_app/presentation/pages/details_page.dart';
import 'package:time_zone_app/presentation/blocs/time/time_bloc.dart';
import 'package:time_zone_app/presentation/widgets/time_zone_card.dart';

class TimeZoneListView extends StatelessWidget {
  const TimeZoneListView({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode();
    return BlocBuilder<TimeBloc, TimeState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                focusNode: focusNode,
                decoration: const InputDecoration(
                  labelText: 'Buscar zona horaria',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (query) {
                  context
                      .read<TimeBloc>()
                      .add(SearchLocalTimeEvent(query: query));
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView.separated(
                itemCount: state.filteredTimes.isNotEmpty
                    ? state.filteredTimes.length
                    : state.times.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10.0),
                itemBuilder: (context, index) {
                  final TimeEntity timeEntity;
                  if (state.filteredTimes.isNotEmpty) {
                    timeEntity = state.filteredTimes[index];
                  } else {
                    timeEntity = state.times[index];
                  }
                  return TimeZoneCard(
                    timeZone: timeEntity.timezone,
                    dateTime: DateFormat('yyyy-dd-MM hh:mm a')
                        .format(timeEntity.datetime),
                    onTap: () {
                      focusNode.unfocus();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TimeZoneDetailsPage(timeEntity: timeEntity),
                        ),
                      );
                    },
                    onDelete: () {
                      _showDeleteConfirmation(context, timeEntity);
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmation(BuildContext context, TimeEntity timeEntity) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Eliminar Zona horaria',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content:
            const Text('¿Está seguro de que desea eliminar esta zona horaria?'),
        actions: [
          TextButton(
            onPressed: () {
              context
                  .read<TimeBloc>()
                  .add(RemoveTimezoneEvent(timeEntity.timezone));
              Navigator.pop(context);
            },
            child: const Text('Eliminar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
        ],
      ),
    );
  }
}

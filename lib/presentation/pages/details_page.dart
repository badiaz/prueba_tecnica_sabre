import 'package:flutter/material.dart';
import 'package:time_zone_app/domain/entities/time_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_zone_app/presentation/blocs/time/time_bloc.dart';
import 'package:time_zone_app/presentation/widgets/time_zone_info_container.dart';

class TimeZoneDetailsPage extends StatelessWidget {
  final TimeEntity timeEntity;

  const TimeZoneDetailsPage({super.key, required this.timeEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          timeEntity.timezone,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              _showDeleteConfirmation(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TimeZoneInfoContainer(timeEntity: timeEntity),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
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

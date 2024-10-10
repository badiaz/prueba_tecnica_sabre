import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_zone_app/presentation/blocs/time/time_bloc.dart';

class TimeZonePopupMenu extends StatelessWidget {
  const TimeZonePopupMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeBloc, TimeState>(
      builder: (context, state) {
        return PopupMenuButton<String>(
          icon: const Icon(Icons.add),
          onSelected: (timezone) {
            context.read<TimeBloc>().add(AddTimezoneEvent(timezone));
          },
          itemBuilder: (context) => state.timezones
              .map((timezone) => PopupMenuItem(
                    value: timezone,
                    child: Text(timezone),
                  ))
              .toList(),
        );
      },
    );
  }
}

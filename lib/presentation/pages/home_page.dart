import 'package:flutter/material.dart';
import 'package:time_zone_app/presentation/widgets/time_zone_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('World Time Zones'),
        ),
        body: ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, index) => const SizedBox(
            height: 10.0,
          ),
          itemBuilder: (context, index) {
            if (index == 0) {
              return TimeZoneCard(
                timeZone: 'America/Argentina/Salta',
                dateTime: '${DateTime.now()}',
              );
            }
            return const TimeZoneCard(
              timeZone: 'No Timezone',
              dateTime: 'Sin hora',
            );
          },
        ));
  }
}

import 'package:flutter/material.dart';

class TimeZoneCard extends StatelessWidget {
  final String timeZone;
  final String dateTime;
  const TimeZoneCard({
    super.key,
    required this.timeZone,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        width: size.width * 0.7,
        height: size.height * 0.15,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            border: Border.all(width: 2.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Time Zone:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Text(
              timeZone,
              style: const TextStyle(fontSize: 16.0),
            ),
            const Text(
              'Date time:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Text(
              dateTime,
              style: const TextStyle(fontSize: 16.0),
            )
          ],
        ),
      ),
    );
  }
}

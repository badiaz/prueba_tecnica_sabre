import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:time_zone_app/domain/entities/time_entity.dart';

class TimeZoneInfoContainer extends StatelessWidget {
  final TimeEntity timeEntity;
  const TimeZoneInfoContainer({super.key, required this.timeEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        border: Border.all(color: Colors.black, width: 2.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TimeZoneInfoRow(
            title: 'Día y Hora: ',
            value: DateFormat('yyyy-dd-MM hh:mm a').format(timeEntity.datetime),
          ),
          TimeZoneInfoRow(
            title: 'Día de la semana: ',
            value: timeEntity.dayOfWeek.toString(),
          ),
          TimeZoneInfoRow(
            title: 'Día del año: ',
            value: timeEntity.dayOfYear.toString(),
          ),
          TimeZoneInfoRow(
            title: 'Número de la semana: ',
            value: timeEntity.weekNumber.toString(),
          ),
          TimeZoneInfoRow(
            title: 'Abreviación: ',
            value: timeEntity.abbreviation,
          ),
          TimeZoneInfoRow(
            title: 'Tiempo Unix: ',
            value: timeEntity.unixtime.toString(),
          ),
        ],
      ),
    );
  }
}

class TimeZoneInfoRow extends StatelessWidget {
  final String title;
  final String value;
  const TimeZoneInfoRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: RichText(
        text: TextSpan(
          text: title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 16.0,
          ),
          children: [
            TextSpan(
              text: value,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

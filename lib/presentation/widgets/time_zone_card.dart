import 'package:flutter/material.dart';

class TimeZoneCard extends StatelessWidget {
  final String timeZone;
  final String dateTime;
  final VoidCallback onTap;
  final VoidCallback onDelete;
  const TimeZoneCard({
    super.key,
    required this.timeZone,
    required this.dateTime,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          width: size.width * 0.7,
          height: size.height * 0.15,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              border: Border.all(width: 2.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Zona horaria:',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    timeZone,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const Text(
                    'Día y hora:',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    dateTime,
                    style: const TextStyle(fontSize: 16.0),
                  )
                ],
              ),
              IconButton(
                  onPressed: () => onDelete(), icon: const Icon(Icons.delete))
            ],
          ),
        ),
      ),
    );
  }
}

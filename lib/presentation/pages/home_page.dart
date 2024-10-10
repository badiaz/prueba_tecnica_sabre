import 'package:flutter/material.dart';
import 'package:time_zone_app/presentation/widgets/time_zone_list_view.dart';
import 'package:time_zone_app/presentation/widgets/time_zone_popup_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('World Time Zones'),
        actions: const [
          TimeZonePopupMenu(),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              TimeZoneListView(),
            ],
          ),
        ),
      ),
    );
  }
}

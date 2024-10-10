import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_zone_app/domain/use_cases/get_current_timezon_use_case_interface.dart';
import 'package:time_zone_app/domain/use_cases/get_current_timezone_use_case.dart';
import 'package:time_zone_app/domain/use_cases/get_time_for_timezone_use_case.dart';
import 'package:time_zone_app/domain/use_cases/get_time_for_timezone_use_case_interface.dart';
import 'package:time_zone_app/domain/use_cases/get_timezones_use_case.dart';
import 'package:time_zone_app/domain/use_cases/get_timezones_use_case_interface.dart';
import 'package:time_zone_app/infrastructure/repositories/time/timezone_repository.dart';
import 'package:time_zone_app/infrastructure/repositories/time/timezone_respository_interface.dart';
import 'package:time_zone_app/presentation/blocs/time/time_bloc.dart';
import 'package:time_zone_app/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final TimezoneRespositoryInterface timeRepository = TimezoneRepository();
    final GetTimeForTimezoneUseCaseInterface getTimeForTimezoneUseCase =
        GetTimeForTimezoneUseCase(timeRespository: timeRepository);
    final GetTimezonesUseCaseInterface getTimezoneUseCase =
        GetTimezonesUseCase(timeRespository: timeRepository);

    final GetCurrentTimezoneUseCaseInterface getCurrentTimezoneUseCase =
        GetCurrentTimezoneUseCase(timeRespository: timeRepository);
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => TimeBloc(
                  getTimeZoneUseCase: getTimezoneUseCase,
                  getTimeForTimeZoneUseCase: getTimeForTimezoneUseCase,
                  getCurrentTimezoneUseCase: getCurrentTimezoneUseCase)
                ..add(GetTimeZonesEvent())
                ..add(GetCurrentTimeEvent()))
        ],
        child: MaterialApp(
          title: 'Time Zone App',
          theme: ThemeData(
            primaryColor: Colors.black,
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2.0),
              ),
            ),
          ),
          home: const HomePage(),
        ));
  }
}

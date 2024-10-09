import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_zone_app/domain/use_cases/get_time_for_timezone_use_case.dart';
import 'package:time_zone_app/domain/use_cases/get_time_for_timezone_use_case_interface.dart';
import 'package:time_zone_app/domain/use_cases/get_timezone_use_case_interface.dart';
import 'package:time_zone_app/domain/use_cases/get_timezones_use_case.dart';
import 'package:time_zone_app/domain/use_cases/get_timezones_use_case_interface.dart';
import 'package:time_zone_app/infrastructure/repositories/time/time_repository.dart';
import 'package:time_zone_app/infrastructure/repositories/time/time_respository_interface.dart';
import 'package:time_zone_app/presentation/blocs/time/time_bloc.dart';
import 'package:time_zone_app/presentation/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final TimeRespositoryInterface timeRepository = TimeRepository();
    final GetTimeForTimezoneUseCaseInterface getTimeForTimezoneUseCase =
        GetTimeForTimezoneUseCase(timeRespository: timeRepository);

    final GetTimezonesUseCaseInterface getTimezoneUseCase =
        GetTimezonesUseCase(timeRespository: timeRepository);
    return MultiBlocProvider(providers: [
      BlocProvider(
          create: (_) => TimeBloc(
              getTimeZoneUseCase: getTimezoneUseCase,
              getTimeForTimeZoneUseCase: getTimeForTimezoneUseCase))
    ], child: const MaterialApp(title: 'Material App', home: HomePage()));
  }
}

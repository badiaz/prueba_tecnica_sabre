import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_zone_app/domain/use_cases/get_time_for_timezone_use_case_interface.dart';
import 'package:time_zone_app/domain/use_cases/get_timezones_use_case_interface.dart';

part 'time_event.dart';
part 'time_state.dart';

class TimeBloc extends Bloc<TimeEvent, TimeState> {
  final GetTimezonesUseCaseInterface getTimeZoneUseCase;
  final GetTimeForTimezoneUseCaseInterface getTimeForTimeZoneUseCase;
  TimeBloc({
    required this.getTimeZoneUseCase,
    required this.getTimeForTimeZoneUseCase,
  }) : super(const TimeState()) {
    on<GetTimeZonesEvent>((event, emit) async {
      final timeZones = await getTimeZoneUseCase.call();
    });
  }
}

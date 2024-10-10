import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_zone_app/domain/entities/time_entity.dart';
import 'package:time_zone_app/domain/use_cases/get_timezones_use_case_interface.dart';
import 'package:time_zone_app/domain/use_cases/get_current_timezon_use_case_interface.dart';
import 'package:time_zone_app/domain/use_cases/get_time_for_timezone_use_case_interface.dart';

part 'time_event.dart';
part 'time_state.dart';

class TimeBloc extends Bloc<TimeEvent, TimeState> {
  final GetTimezonesUseCaseInterface getTimeZoneUseCase;
  final GetCurrentTimezoneUseCaseInterface getCurrentTimezoneUseCase;
  final GetTimeForTimezoneUseCaseInterface getTimeForTimeZoneUseCase;
  TimeBloc({
    required this.getTimeZoneUseCase,
    required this.getTimeForTimeZoneUseCase,
    required this.getCurrentTimezoneUseCase,
  }) : super(const TimeState()) {
    on<GetTimeZonesEvent>((event, emit) async {
      try {
        final timeZones = await getTimeZoneUseCase.call();
        emit(state.copyWith(timezones: timeZones));
      } catch (e) {
        throw Exception();
      }
    });

    on<AddTimezoneEvent>((event, emit) async {
      try {
        final exists = state.times
            .any((timeEntity) => timeEntity.timezone == event.timezone);

        if (!exists) {
          final newTime =
              await getTimeForTimeZoneUseCase.call(timeZone: event.timezone);
          final updatedList = List<TimeEntity>.from(state.times)..add(newTime);
          emit(state.copyWith(times: updatedList));
        }
      } catch (e) {
        throw Exception();
      }
    });

    on<GetCurrentTimeEvent>((event, emit) async {
      try {
        final currentTime = await getCurrentTimezoneUseCase.call();
        final updatedList = List<TimeEntity>.from(state.times)
          ..add(currentTime);
        emit(state.copyWith(times: updatedList));
      } catch (e) {
        throw Exception();
      }
    });

    on<RemoveTimezoneEvent>((event, emit) async {
      final updatedTimes = List<TimeEntity>.from(state.times)
        ..removeWhere((time) => time.timezone == event.timezone);
      emit(state.copyWith(times: updatedTimes, filteredTimes: []));
    });

    on<SearchLocalTimeEvent>((event, emit) async {
      if (event.query != '') {
        final filtered = state.times.where((timeEntity) {
          return timeEntity.timezone
              .toLowerCase()
              .contains(event.query.toLowerCase());
        }).toList();
        emit(state.copyWith(filteredTimes: filtered));
      } else {
        emit(state.copyWith(filteredTimes: []));
      }
    });
  }
}

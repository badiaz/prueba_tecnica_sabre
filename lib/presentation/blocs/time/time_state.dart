part of 'time_bloc.dart';

class TimeState extends Equatable {
  final List<TimeEntity> times;
  final List<TimeEntity> filteredTimes;
  final List<String> timezones;

  const TimeState(
      {this.timezones = const [],
      this.times = const [],
      this.filteredTimes = const []});

  TimeState copyWith({
    List<TimeEntity>? times,
    List<String>? timezones,
    List<TimeEntity>? filteredTimes,
  }) =>
      TimeState(
          times: times ?? this.times,
          timezones: timezones ?? this.timezones,
          filteredTimes: filteredTimes ?? this.filteredTimes);

  @override
  List<Object?> get props => [times, timezones, filteredTimes];
}

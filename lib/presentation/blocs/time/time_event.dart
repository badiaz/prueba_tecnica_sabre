part of 'time_bloc.dart';

sealed class TimeEvent extends Equatable {
  const TimeEvent();

  @override
  List<Object> get props => [];
}

class GetTimeZonesEvent extends TimeEvent {}

part of 'time_bloc.dart';

sealed class TimeEvent extends Equatable {
  const TimeEvent();

  @override
  List<Object> get props => [];
}

class GetTimeZonesEvent extends TimeEvent {}

class GetCurrentTimeEvent extends TimeEvent {}

class SearchLocalTimeEvent extends TimeEvent {
  final String query;
  const SearchLocalTimeEvent({required this.query});
}

class AddTimezoneEvent extends TimeEvent {
  final String timezone;
  const AddTimezoneEvent(this.timezone);
}

class RemoveTimezoneEvent extends TimeEvent {
  final String timezone;
  const RemoveTimezoneEvent(this.timezone);
}

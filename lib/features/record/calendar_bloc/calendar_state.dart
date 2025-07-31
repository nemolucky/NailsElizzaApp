part of 'calendar_bloc.dart';

abstract class CalendarState {}

class CalendarBlocInitial extends CalendarState{}

class EventsLoading extends CalendarState{}

class EventsLoaded extends CalendarState{
  EventsLoaded({required this.manicureEvents});

  final Map<DateTime, List<TimeOfDay>> manicureEvents;
}
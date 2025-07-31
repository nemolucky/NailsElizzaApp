import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/repositories/manicure_record/manicure_record.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {

  final manicureRepository = GetIt.I.get<AbstractManicureRecordRepository>();

  CalendarBloc() : super(CalendarBlocInitial()) {
    on<LoadEvents>((event, emit) async {
      emit (EventsLoading());
      final Map<DateTime, List<TimeOfDay>> manicureEvents = await manicureRepository.loadManicureEvents();
      emit (EventsLoaded(manicureEvents: manicureEvents));
    });
  }
}
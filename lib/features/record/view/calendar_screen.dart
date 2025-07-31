import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:app/features/utils/widgets/widgets.dart';
import 'package:app/features/record/widgets/widgets.dart';
import 'package:app/features/record/calendar_bloc/calendar_bloc.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalendarBloc()..add(LoadEvents()),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<CalendarBloc, CalendarState>(
            builder: (context, state) {
              if (state is EventsLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is EventsLoaded) {
                return _CalendarView(events: state.manicureEvents);
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}

class _CalendarView extends StatefulWidget {
  final Map<DateTime, List<TimeOfDay>> events;

  const _CalendarView({required this.events});

  @override
  State<_CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<_CalendarView> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  int _getEventCount(DateTime date) {
    final normalizedDate = DateTime(date.year, date.month, date.day);
    return widget.events[normalizedDate]?.length ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 1),
        const Headliner(label: "Выбор времени"),
        const Spacer(flex: 1),
        CalendarDecoration(
          child: TableCalendar(
            locale: 'en_US',
            rowHeight: 40,
            firstDay: DateTime(2000),
            lastDay: DateTime(2050),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            daysOfWeekHeight: 30,
            onFormatChanged: (format) {
              setState(() => _calendarFormat = format);
            },
            onPageChanged: (focusedDay) {
              setState(() => _focusedDay = focusedDay);
            },
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            calendarBuilders: CalendarBuilders(
                headerTitleBuilder: (context, month) {
                    return UniversalComponent(
                        date: month,
                        isMonthTitle: true,
                    );
                    },
                dowBuilder: (context, day) {
                    return UniversalComponent(
                        date: day,
                        isDayOfTheWeek: true,
                    );
                    },
                outsideBuilder: (context, day, _) {
                    return UniversalComponent(
                        date: day,
                        isOutside: true,
                    );
                    },
                defaultBuilder: (context, date, _) {
                    return UniversalComponent(
                        date: date,
                        countEvent: _getEventCount(
                        date,
                        ),
                    );
                    },
                selectedBuilder: (context, date, _) {
                    return UniversalComponent(
                        date: date,
                        isSelected: true,
                        countEvent: _getEventCount(
                        date,
                        ),
                    );
                    },
                todayBuilder: (context, date, _) {
                    return UniversalComponent(
                        date: date,
                        isToday: true,
                        countEvent: _getEventCount(
                        date,
                        ),
                    );
                }
            ),
          ),
        ),
        const Spacer(flex: 2),
        if (_selectedDay != null)
          _buildEventList(_selectedDay!),
        const Spacer(flex: 2),
        const BaseButton(buttonText: "Продолжить"),
        const Spacer(flex: 2),
      ],
    );
  }



Widget _buildEventList(DateTime day) {
  final normalizedDate = DateTime(day.year, day.month, day.day);
  final events = widget.events[normalizedDate] ?? [];

  if (events.isEmpty) return Container();

  return SizedBox(
    height: 60, 
    child: Center(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true, 
        physics: const ClampingScrollPhysics(),        
        itemCount: events.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Chip(
            label: Text(events[index].format(context)),
          ),
        ),
      ),
    ),
  );
}
}
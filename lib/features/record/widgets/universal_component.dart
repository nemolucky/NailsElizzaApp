import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:app/features/config/theme/text_styles.dart';

class UniversalComponent extends StatelessWidget {
  const UniversalComponent({
    super.key, 
    required this.date,
    this.isMonthTitle = false,
    this.isDayOfTheWeek = false,
    this.isOutside = false, 
    this.isSelected = false,
    this.isToday = false,
    this.countEvent = 0
  });

  final DateTime date;
  final bool isMonthTitle, isDayOfTheWeek, isOutside, isSelected, isToday;
  final int countEvent;


  TextStyle _getTextStyle() {
    if (isSelected) return TextStyles.calendarSelectedDay;
    if (isOutside) return TextStyles.calendarOutsideDay;
    return TextStyles.calendarDay;
  }

  Widget _buildEventDots(context) {
    final visibleCount = countEvent > 3 ? 3 : countEvent;
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(visibleCount, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 1.5),
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Container(
        decoration: BoxDecoration(
          color: isSelected ? theme.primaryColor : null,
          border: isToday ? Border.all(
            width: 1,
            color: theme.primaryColor
          ) : null,
          borderRadius: isToday || isSelected ? BorderRadius.circular(8) : null
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isMonthTitle ? DateFormat('MMMM yyyy').format(date) : 
                isDayOfTheWeek ? DateFormat.E().format(date) :'${date.day}',
                style: _getTextStyle(),
              ),
              if (countEvent > 0 && !isMonthTitle && !isDayOfTheWeek) 
              SizedBox(height: 2), // Небольшой отступ
            if (countEvent > 0 && !isMonthTitle && !isDayOfTheWeek)
              _buildEventDots(context),
            ],
          ),
        ),
    );
  }
}
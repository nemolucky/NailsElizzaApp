import 'package:app/features/config/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomAppBar extends StatelessWidget {

  final int currentIndex;
  final Function(int) onTabSelected;

  const CustomBottomAppBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey, 
              width: 1,        
            ),
          ),
        ),
        child: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTabItem(
                0,
                "assets/icons/home_icon.svg",
                "Главная",
                context
              ), 
              _buildTabItem(
                1,
                "assets/icons/records_icon.svg",
                "Записи",
                context
              ), 
              _buildTabItem(
                2,
                "assets/icons/others_icon.svg",
                "Прочее",
                context
              ),                                                                  
            ],
          ),
        )
      ),
    );
  }
  Widget _buildTabItem(int index, String icon, String label, BuildContext context){
    final isSelected = currentIndex == index;
    final theme = Theme.of(context);
    return Expanded(
      child: InkWell(
        onTap:() => onTabSelected(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icon,
              width: 30, 
              height: 30,
              colorFilter: isSelected 
                ? ColorFilter.mode(
                    theme.primaryColor, 
                    BlendMode.srcIn,
                  )
                : null,
            ),
            const SizedBox(height: 4),
            if (isSelected)
            Text(
              label,
              style: TextStyles.smallText.copyWith(
                color: theme.primaryColor,
                height: 1.2,  
              )
            )
          ],
        ),
      )
    );
  }
}
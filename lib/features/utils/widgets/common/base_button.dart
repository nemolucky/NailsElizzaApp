import 'package:app/features/config/theme/text_styles.dart';
import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    super.key,
    required this.buttonText,
    this.function
  });

  final String buttonText;
  final void Function()? function;

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 70,
        maxWidth: 420,
        minHeight: 50,
        minWidth: 300
      ),
      child: AspectRatio(
        aspectRatio: 6,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: ElevatedButton(
            onPressed: function,
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.primaryColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              )
            ),
            child: Text(
                buttonText,
                style: TextStyles.mediumText,
              ),
            ),
        ),
      ),
    );
  }
}
import 'package:app/features/config/theme/text_styles.dart';
import 'package:flutter/material.dart';

class Promt extends StatelessWidget {
  const Promt({
    super.key, 
    required this.route,
    required this.question,
    required this.transition
  });

  final String question;
  final String transition;
  final String route;

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Text.rich(
        TextSpan(
            text: question,
            style: TextStyles.mediumText.copyWith(
                color: Colors.black
            ),
            children: <InlineSpan>[
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: TextButton(
                    onPressed: (){
                            Navigator.of(context).pushNamed(route);
                        }, 
                    child: Text(
                      transition,
                      style: TextStyles.mediumText.copyWith(
                          color: theme.primaryColor,
                          decoration: TextDecoration.underline,
                          decorationColor: theme.primaryColor
                      )
                    )
                  )
                )
            ]
        )
    );
  }
}
import 'package:app/features/config/theme/text_styles.dart';
import 'package:flutter/material.dart';

class Headliner extends StatelessWidget {
  const Headliner({
    super.key,
    required this.label
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const Spacer(flex: 3,),
        InkWell(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
        ),
        const Spacer(flex: 2,),
        Text(label, style: TextStyles.title,),
        const Spacer(flex: 5,)
      ],
    );
  }
}
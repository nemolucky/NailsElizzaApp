import 'package:flutter/material.dart';
import 'package:app/features/config/theme/text_styles.dart';

class WorkTile extends StatelessWidget {
  const WorkTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 0.8,
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
              ),
          ),
        ),
        const SizedBox(height: 10,),
        const Text("Гигиенический маникюр/маникюр", style: TextStyles.smallText,)
      ],
    );
  }
}
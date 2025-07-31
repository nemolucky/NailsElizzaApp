import 'package:app/features/config/theme/text_styles.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {

  const InputField({
    super.key,
    required this.hintText,
    required this.controller,
    this.obsecure = false
  });

  final String hintText;
  final bool obsecure;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 70,
        maxWidth: 385,
        minHeight: 50,
        minWidth: 275
      ),
      child: AspectRatio(
        aspectRatio: 5.5,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Align(
            alignment: Alignment.center,
            child: TextField(
              obscureText: obsecure,
              style: TextStyles.smallText,
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyles.smallText,
                hintText: hintText,
                contentPadding: EdgeInsets.only(left: 16)
              ),
            ),
          ),
        ),
        ),
      );
  }
}
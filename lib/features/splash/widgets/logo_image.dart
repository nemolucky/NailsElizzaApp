import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({
    super.key, 
    required this.route
  });

  final String route;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 300,
          maxWidth: 300
        ),
        child: AspectRatio(
          aspectRatio: 1,
          child: Image.asset(route)
        ),
      ),
    );
  }
}
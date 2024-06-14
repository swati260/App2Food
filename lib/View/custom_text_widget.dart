import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  CustomText({required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text, style: style ?? Theme.of(context).textTheme.bodySmall,
      textAlign: TextAlign.center, // Align text center
    );
  }
}

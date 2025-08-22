import 'package:flutter/material.dart';
import 'package:dalel/core/utils/app_text_styles.dart';

class CustomHeaderText extends StatelessWidget {
  const CustomHeaderText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CustomTextStyles.poppins400style20,
    );
  }
}
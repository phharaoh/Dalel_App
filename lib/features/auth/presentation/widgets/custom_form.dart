import 'package:flutter/material.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({
    super.key,
    required this.labelText,
    this.onChange,
    this.onFieldSubmitted,
  });
  final String labelText;
  final void Function(String)? onChange;
  final void Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 24),
      child: TextFormField(
        onChanged: onChange,
        onFieldSubmitted: onFieldSubmitted,

        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: CustomTextStyles.pacifico500style18,
          border: getBorderStyle(),
          enabledBorder: getBorderStyle(),
          focusedBorder: getBorderStyle(),
        ),
      ),
    );
  }
}

OutlineInputBorder getBorderStyle() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(color: AppColors.grey),
  );
}

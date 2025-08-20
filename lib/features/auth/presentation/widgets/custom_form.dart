import 'package:flutter/material.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.onChanged,
    this.onFieldSubmitted,
    this.suffix,
  });
  final String labelText;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 24),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'this field is required';
          } else {
            return null;
          }
        },

        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,

        decoration: InputDecoration(
          suffixIcon: suffix,
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

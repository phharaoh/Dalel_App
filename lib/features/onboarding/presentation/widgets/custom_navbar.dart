import 'package:flutter/material.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/cache/cache_helper.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/functions/my_navigator.dart';
import 'package:dalel/core/services/service_locator.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          getIt<CacheHelper>().setData(key: 'isVisited', value: true);
          pushReplaceNavigator(context, '/signUp');
        },
        child: Text(
          AppStrings.skip,
          style: CustomTextStyles.poppins300style16.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

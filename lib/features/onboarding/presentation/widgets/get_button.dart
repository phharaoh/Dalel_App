import 'package:flutter/material.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/cache/cache_helper.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/functions/my_navigator.dart';
import 'package:dalel/core/services/service_locator.dart';
import 'package:dalel/core/functions/set_data_method.dart';
import 'package:dalel/features/onboarding/data/models/onboarding_model.dart';

class GetButtons extends StatelessWidget {
  const GetButtons({
    super.key,
    required this.currentIndex,
    required this.controller,
  });
  final int currentIndex;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    if (currentIndex == onBoardingData.length - 1) {
      return Column(
        children: [
          CustomBtn(
            text: AppStrings.createAccount,
            onPressed: () {
              getIt<CacheHelper>().setData(key: 'isVisited', value: true);

              pushReplaceNavigator(context, "/signUp");
            },
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              saveData();

              pushReplaceNavigator(context, "/signIn");
            },
            child: Text(
              AppStrings.loginNow,
              style: CustomTextStyles.poppins300style16.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      );
    } else {
      return CustomBtn(
        text: AppStrings.next,
        onPressed: () {
          controller.nextPage(
            duration: const Duration(microseconds: 200),
            curve: Curves.bounceIn,
          );
        },
      );
    }
  }
}

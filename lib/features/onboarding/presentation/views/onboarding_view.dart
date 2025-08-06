import 'package:flutter/material.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:dalel/features/onboarding/presentation/widgets/custom_navbar.dart';
import 'package:dalel/features/onboarding/presentation/widgets/onboarding_widget_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 40),
              CustomNavBar(),
              OnboardingWidgetBody(),
              CustomBtn(text: AppStrings.next),
              const SizedBox(height: 17),
            ],
          ),
        ),
      ),
    );
  }
}

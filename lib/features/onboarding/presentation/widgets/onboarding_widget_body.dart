import 'package:flutter/material.dart';
import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/onboarding/presentation/widgets/custom_smooth_indicator.dart';

class OnboardingWidgetBody extends StatelessWidget {
  OnboardingWidgetBody({super.key});
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: _controller,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Image.asset(Assets.assetsImagesOnBoarding),
              const SizedBox(height: 24),
              CustomSmoothPageIndicator(controller: _controller),
              const SizedBox(height: 32),
              Text(
                "Explore The history with Dalel in a smart way",
                style: CustomTextStyles.poppins500style24.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                "Explore The history with Dalel in a smart way",
                style: CustomTextStyles.poppins300style16,
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }
}

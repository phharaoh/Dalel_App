import 'package:flutter/material.dart';
import 'package:dalel/features/onboarding/presentation/widgets/get_button.dart';
import 'package:dalel/features/onboarding/presentation/widgets/custom_navbar.dart';
import 'package:dalel/features/onboarding/presentation/widgets/onboarding_widget_body.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 40),
              const CustomNavBar(),
              OnboardingWidgetBody(
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                controller: _controller,
              ),
              const SizedBox(height: 88),

              GetButtons(currentIndex: currentIndex, controller: _controller),

              const SizedBox(height: 17),
            ],
          ),
        ),
      ),
    );
  }
}

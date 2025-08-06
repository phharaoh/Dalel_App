import 'package:flutter/material.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/cache/cache_helper.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/services/service_locator.dart';
import 'package:dalel/core/functions/delayed_method.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    var isVisited = getIt<CacheHelper>().getData(key: 'isVisited') ?? false;
    if (isVisited == true) {
      delayedNavigator(context, '/signUp');
    } else {
      delayedNavigator(context, '/onBoarding');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          AppStrings.appName,
          style: CustomTextStyles.pacifico400style64,
        ),
      ),
    );
  }
}


import 'package:go_router/go_router.dart';
import 'package:dalel/features/splash/presentation/views/splash_view.dart';
import 'package:dalel/features/onboarding/presentation/views/onboarding_view.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(path: '/', builder: (context, state) => SplashView()),
    GoRoute(path: '/onBoarding', builder: (context, state) => OnboardingView()),
  ],
);

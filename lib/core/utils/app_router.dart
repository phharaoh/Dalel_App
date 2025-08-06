import 'package:go_router/go_router.dart';
import 'package:dalel/features/auth/presentation/views/signin_view.dart';
import 'package:dalel/features/auth/presentation/views/signup_view.dart';
import 'package:dalel/features/splash/presentation/views/splash_view.dart';
import 'package:dalel/features/onboarding/presentation/views/onboarding_view.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(path: '/', builder: (context, state) => SplashView()),
    GoRoute(path: '/onBoarding', builder: (context, state) => OnboardingView()),
    GoRoute(path: "/signUp", builder: (context, state) => const SignUpView()),
    GoRoute(path: "/signIn", builder: (context, state) => const SignInView()),
  ],
);

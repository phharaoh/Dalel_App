import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dalel/features/auth/presentation/views/sign_up_view.dart';
import 'package:dalel/features/auth/presentation/views/sign_in_view.dart';
import 'package:dalel/features/splash/presentation/views/splash_view.dart';
import 'package:dalel/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:dalel/features/onboarding/presentation/views/onboarding_view.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(path: '/', builder: (context, state) => SplashView()),
    GoRoute(path: '/onBoarding', builder: (context, state) => OnboardingView()),
    GoRoute(
      path: "/signUp",
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const SignUpView(),
      ),
    ),
    GoRoute(path: "/signIn", builder: (context, state) => const SignInView()),
  ],
);

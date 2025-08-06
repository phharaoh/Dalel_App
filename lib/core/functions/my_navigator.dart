import 'package:go_router/go_router.dart';

void pushNavigator(context, String path) {
  GoRouter.of(context).push(path);
}

void pushReplaceNavigator(context, String path) {
  GoRouter.of(context).pushReplacement(path);
}

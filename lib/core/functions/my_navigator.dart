import 'package:go_router/go_router.dart';

void myNavigation(context, String path) {
  GoRouter.of(context).push(path);
}

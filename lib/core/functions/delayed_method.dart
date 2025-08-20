import 'package:dalel/core/functions/my_navigator.dart';

void delayedNavigator(context, String path) {
  Future.delayed(const Duration(seconds: 3), () {
    pushReplaceNavigator(context, path);
  });
}

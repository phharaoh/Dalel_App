import 'package:fluttertoast/fluttertoast.dart';
import 'package:dalel/core/utils/app_colors.dart';

showToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: AppColors.primaryColor,
    textColor: AppColors.offWhite,
    fontSize: 16.0,
  );
}

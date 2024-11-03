import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:horeca_smart/core/utils/app_colors.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';

enum ToastStates { success, error, warning }

/*  show message toast ...*/
void showToast({
  required String message,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );
/* switch method to choose color...*/
Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.success:
      color = AppColors.primaryColor;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
    case ToastStates.warning:
      color = const Color(0xFFFFC107);
      break;
  }
  return color;
}

void showMessage({
  required String message,
  required ToastStates state,
  required BuildContext context,
}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 12),
        behavior: SnackBarBehavior.floating,
        backgroundColor: chooseToastColor(state),
        showCloseIcon: true,
        closeIconColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Container(
          padding: const EdgeInsets.all(5),
          child: Text(
            message,
            style: AppStyles.whiteColorTextW600Size14,
          ),
        ),
      ),
    );

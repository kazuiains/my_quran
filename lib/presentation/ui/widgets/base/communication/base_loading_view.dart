import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:my_quran/app/config/app_colors.dart';
import 'package:my_quran/app/config/localizations/translation_key.dart';

class BaseLoadingView {
  static init() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = AppColors.primary
      ..backgroundColor = Colors.white
      ..indicatorColor = AppColors.primary
      ..textColor = AppColors.black
      ..maskColor = Colors.white.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = false
      ..animationStyle = EasyLoadingAnimationStyle.scale
      ..maskType = EasyLoadingMaskType.black;
  }

  static show({
    String? text,
    EasyLoadingMaskType? maskType,
  }) async {
    await EasyLoading.show(
      maskType: maskType,
      status: text ?? generalLoading.tr,
    );
  }

  static dismiss() async {
    await EasyLoading.dismiss();
  }
}

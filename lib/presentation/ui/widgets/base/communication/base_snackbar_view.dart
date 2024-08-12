import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_quran/app/config/app_colors.dart';
import 'package:my_quran/app/config/app_styles.dart';
import 'package:my_quran/app/config/localizations/translation_key.dart';
import 'package:my_quran/app/types/snack_bar_type.dart';
import 'package:my_quran/presentation/ui/widgets/base/actions/base_buttons_view.dart';
import 'package:my_quran/presentation/ui/widgets/base/containment/base_spacer_view.dart';

class BaseSnackBarView {
  // static SnackbarController flat({
  //   SnackBarType snackBarType = SnackBarType.success,
  //   required String message,
  //   Color? color,
  //   SnackPosition? snackPosition,
  //   bool primary = true,
  // }) {
  //   return Get.snackbar(
  //     "",
  //     "",
  //     titleText: Container(),
  //     messageText: Column(
  //       crossAxisAlignment: CrossAxisAlignment.stretch,
  //       children: [
  //         Text(
  //           message,
  //           style: TextStyles.snackBarWithOutTitleButtonMessage,
  //         ),
  //         BaseSpacerView.h10,
  //       ],
  //     ),
  //     snackPosition: snackPosition ?? SnackPosition.TOP,
  //     backgroundColor:
  //         primary ? AppColors.primary : color ?? snackBarType.color,
  //     colorText: AppColors.whiteText,
  //     margin: const EdgeInsets.all(10),
  //     borderRadius: 8,
  //     mainButton: BaseButtonView.flatTextButton(
  //       onPressed: () => Get.closeCurrentSnackbar(),
  //       style: ButtonStyles.defaultSnackBar(
  //         color: AppColors.white25,
  //       ),
  //       label: snackBarTextClose.tr,
  //       textStyle: TextStyles.snackBarWithOutTitleButtonTitle,
  //     ),
  //   );
  // }
}

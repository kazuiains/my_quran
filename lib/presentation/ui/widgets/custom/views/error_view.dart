import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:my_quran/app/config/app_colors.dart';
import 'package:my_quran/app/config/localizations/translation_key.dart';
import 'package:my_quran/presentation/ui/widgets/base/actions/base_buttons_view.dart';

class ErrorView {
  static Widget basic({
    required String image,
    double? width,
    double? height,
    required String title,
    required String subtitle,
    EdgeInsetsGeometry? padding,
    required void Function()? onPressed,
  }) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  padding: padding ?? const EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        image,
                        width: width,
                        height: height,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 32),
                        child: Text(
                          subtitle,
                          style: TextStyle(
                            color: AppColors.grey,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              height: 65,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                  left: 16,
                  right: 16,
                ),
                child: BaseButtonsView.flat(
                  label: baseLoadingAndErrorRefreshButton.tr,
                  textStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  radiusSize: 16,
                  onPressed: onPressed,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

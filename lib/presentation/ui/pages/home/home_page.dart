import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_quran/app/config/app_colors.dart';
import 'package:my_quran/app/config/app_strings.dart';
import 'package:my_quran/app/config/constants/assets_constants.dart';
import 'package:my_quran/app/config/localizations/translation_key.dart';
import 'package:my_quran/presentation/get/home/home_controller.dart';
import 'package:my_quran/presentation/ui/pages/home/views/sura_item_view.dart';
import 'package:my_quran/presentation/ui/widgets/base/navigation/base_top_app_bar_view.dart';
import 'package:my_quran/presentation/ui/widgets/custom/views/error_view.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseTopAppBarView.flat(
        context,
        backgroundColor: AppColors.primary,
        title: const Text(
          AppStrings.quran,
        ),
        isDark: true,
        useContentPadding: false,
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (controller.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (controller.error) {
              if (controller.errorCode == 0) {
                return ErrorView.basic(
                  image: AssetsConstants.imageIllustrationNoConnection,
                  title: baseLoadingAndErrorErrorTitle1.tr,
                  subtitle: baseLoadingAndErrorErrorMessage1.tr,
                  onPressed: () => controller.onRefresh(),
                );
              } else if (controller.errorCode == 1) {
                return ErrorView.basic(
                  image: AssetsConstants.imageIllustrationEmptyData,
                  title: baseLoadingAndErrorErrorTitle2.tr,
                  subtitle: baseLoadingAndErrorErrorMessage2.tr,
                  onPressed: () => controller.onRefresh(),
                );
              } else if (controller.errorCode == 2) {
                return ErrorView.basic(
                  image: AssetsConstants.imageIllustrationNotFound,
                  title: baseLoadingAndErrorErrorTitle3.tr,
                  subtitle: baseLoadingAndErrorErrorMessage3.tr,
                  onPressed: () => controller.onRefresh(),
                );
              } else if (controller.errorCode == 4) {
                return ErrorView.basic(
                  image: AssetsConstants.imageIllustrationServerError,
                  title: baseLoadingAndErrorErrorTitle5.tr,
                  subtitle: baseLoadingAndErrorErrorMessage5.tr,
                  onPressed: () => controller.onRefresh(),
                );
              } else {
                return ErrorView.basic(
                  image: AssetsConstants.imageIllustrationInternalSystemError,
                  title: baseLoadingAndErrorErrorTitle4.tr,
                  subtitle: baseLoadingAndErrorErrorMessage4.tr,
                  onPressed: () => controller.onRefresh(),
                );
              }
            } else {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Obx(
                    () => SuraItemView(
                      onTap: () => controller.onDetail(context, index),
                      sura: controller.listData[index],
                    ),
                  );
                },
                itemCount: controller.listData.length,
              );
            }
          }
        },
      ),
    );
  }
}

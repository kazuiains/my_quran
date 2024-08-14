import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_quran/app/config/app_colors.dart';
import 'package:my_quran/app/config/constants/assets_constants.dart';
import 'package:my_quran/app/config/localizations/translation_key.dart';
import 'package:my_quran/presentation/get/detail/detail_controller.dart';
import 'package:my_quran/presentation/ui/pages/detail/views/aya_item_view.dart';
import 'package:my_quran/presentation/ui/widgets/base/navigation/base_top_app_bar_view.dart';
import 'package:my_quran/presentation/ui/widgets/custom/views/error_view.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseTopAppBarView.flat(
        context,
        backgroundColor: AppColors.primary,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Text(
                controller.detail.nameLatin ?? "",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Text(
              controller.detail.translation ?? "",
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ],
        ),
        actions: [
          ConstrainedBox(
            constraints: const BoxConstraints.tightFor(width: 56),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                AssetsConstants.iconInterpretation,
                width: 25,
                height: 25,
              ),
            ),
          ),
        ],
        isDark: true,
        useContentPadding: false,
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
                  return AyaItemView(
                    onShare: () {},
                    onPlay: () {},
                    onSave: () {},
                    aya: controller.listData[index],
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

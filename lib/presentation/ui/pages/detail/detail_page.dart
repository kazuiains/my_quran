import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_quran/app/config/app_colors.dart';
import 'package:my_quran/presentation/get/detail/detail_controller.dart';
import 'package:my_quran/presentation/ui/widgets/base/navigation/base_top_app_bar_view.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseTopAppBarView.flat(
        context,
        backgroundColor: AppColors.primary,
        title: Text(
          "Al-Qur'an",
          style: TextStyle(color: AppColors.white),
        ),
        useContentPadding: false,
        centerTitle: true,
      ),
      body: Obx(
            () => ListView.builder(
          // padding: AppDimens.edgeDefaultVerticalListView,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(controller.listData[index].arabicText ?? ""),
            );
          },
          itemCount: controller.listData.length,
        ),
      ),
    );
  }
}

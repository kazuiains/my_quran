import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_quran/app/config/routes/app_routes.dart';
import 'package:my_quran/app/core/network/network_info.dart';
import 'package:my_quran/domain/entities/response/sura.dart';
import 'package:my_quran/domain/use_cases/list_sura_use_case.dart';

class HomeController extends GetxController {
  final ListSuraUseCase useCase;
  final NetworkInfoImpl networkInfo;

  HomeController({
    required this.useCase,
    required this.networkInfo,
  });

  final _listData = <Sura>[].obs;

  set listData(List<Sura> value) {
    _listData.clear();
    _listData.addAll(value);
  }

  List<Sura> get listData => _listData.toList();

  @override
  void onInit() {
    super.onInit();
    onCall();
  }

  onCall() {
    useCase.execute().then(
      (value) {
        //success response
        listData = value.data;
      },
    ).onError(
      (error, stackTrace) {
        //error response
        print("error: $error");
        print("stackTrace: $stackTrace");
      },
    );
  }

  onDetail(BuildContext context, int index) {
    Get.toNamed(
      AppRoutes.detail,
      arguments: listData[index],
    );
  }
}

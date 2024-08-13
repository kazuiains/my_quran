import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_quran/app/config/app_strings.dart';
import 'package:my_quran/app/config/routes/app_routes.dart';
import 'package:my_quran/app/core/network/network_info.dart';
import 'package:my_quran/app/exception/app_exception.dart';
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

  final _loading = true.obs;
  final _error = false.obs;

  int errorCode = 0;

  set listData(List<Sura> value) {
    _listData.clear();
    _listData.addAll(value);
  }

  set loading(bool value) {
    if (value != loading) {
      _loading.value = value;
    }
  }

  set error(bool value) {
    if (value != error) {
      _error.value = value;
    }
  }

  List<Sura> get listData => _listData.toList();

  bool get loading => _loading.value;

  bool get error => _error.value;

  @override
  void onInit() {
    super.onInit();
    onCall();
  }

  onCall() {
    useCase.execute().then(
      (value) async {
        //success response
        loading = false;
        if (value.data.isEmpty) {
          if (!await networkInfo.isConnected) {
            errorCode = 0;
          } else {
            errorCode = 1;
          }
          error = true;
        } else {
          error = false;
          listData = value.data;
        }
      },
    ).onError(
      (error, stackTrace) {
        //error response
        loading = false;
        if (error is AppException) {
          if (error.code == AppStrings.codeAEOther ||
              error.code == AppStrings.codeAEConnectTimeOut ||
              error.code == AppStrings.codeAEBadCertificate ||
              error.code == AppStrings.codeAESendTimeOut ||
              error.code == AppStrings.codeAEReceiveTimeOut) {
            errorCode = 4;
          } else if (error.code == AppStrings.codeAEConnection ||
              error.code == AppStrings.codeAECancel) {
            errorCode = 0;
          } else if (error.code == AppStrings.codeAEResponse) {
            errorCode = 4;
          } else {
            errorCode = 3;
          }
        } else {
          errorCode = 3;
        }
        this.error = true;
      },
    );
  }

  onDetail(BuildContext context, int index) {
    Get.toNamed(
      AppRoutes.detail,
      arguments: listData[index],
    );
  }

  onRefresh() {
    error = false;
    loading = true;
    onCall();
  }
}

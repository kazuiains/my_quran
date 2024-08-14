import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_quran/app/config/app_strings.dart';
import 'package:my_quran/app/config/routes/app_routes.dart';
import 'package:my_quran/app/core/network/network_info.dart';
import 'package:my_quran/app/exception/app_exception.dart';
import 'package:my_quran/domain/entities/response/audio.dart';
import 'package:my_quran/domain/entities/response/aya.dart';
import 'package:my_quran/domain/entities/response/sura.dart';
import 'package:my_quran/domain/use_cases/list_aya_use_case.dart';

class DetailController extends GetxController {
  final ListAyaUseCase useCase;
  final NetworkInfoImpl networkInfo;

  DetailController({
    required this.useCase,
    required this.networkInfo,
  });

  Sura detail = Sura();

  final _listData = <Aya>[].obs;

  final _loading = true.obs;
  final _error = false.obs;

  int errorCode = 0;

  set listData(List<Aya> value) {
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

  List<Aya> get listData => _listData.toList();

  bool get loading => _loading.value;

  bool get error => _error.value;

  @override
  void onInit() {
    super.onInit();
    _initArgument();
    onCall();
  }

  ///to initialize the arguments. arguments are data sent from the previous page
  _initArgument() {
    var argument = Get.arguments;
    if (argument != null && argument is Sura) {
      detail = argument;
    }
  }

  onCall() {
    useCase.execute(detail.number ?? 1).then(
      (value) async {
        //success response
        Sura? sura = value.data;

        loading = false;

        if (sura != null && sura.aya != null && sura.aya!.isNotEmpty) {
          error = false;
          detail = value.data;
          listData = detail.aya ?? [];
        } else {
          if (!await networkInfo.isConnected) {
            errorCode = 0;
          } else {
            errorCode = 1;
          }
          error = true;
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

  onRoute() {
    Get.toNamed(
      AppRoutes.interpretation,
      arguments: detail,
    );
  }

  onPlay(BuildContext context, int index) {
    Audio? audio = listData[index].audio;
    if (audio != null) {
      //play
    }
  }

  onRefresh() {
    error = false;
    loading = true;
    onCall();
  }
}

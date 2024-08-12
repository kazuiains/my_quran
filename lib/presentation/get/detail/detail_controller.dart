import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_quran/app/config/routes/app_routes.dart';
import 'package:my_quran/app/core/network/network_info.dart';
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

  set listData(List<Aya> value) {
    _listData.clear();
    _listData.addAll(value);
  }

  List<Aya> get listData => _listData.toList();

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
      (value) {
        //success response
        detail = value.data;
        listData = detail.aya ?? [];
      },
    ).onError(
      (error, stackTrace) {
        //error response
        print("error: $error");
        print("stackTrace: $stackTrace");
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
}

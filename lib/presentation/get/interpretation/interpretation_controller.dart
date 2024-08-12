import 'package:get/get.dart';
import 'package:my_quran/app/core/network/network_info.dart';
import 'package:my_quran/domain/entities/response/interpretation.dart';
import 'package:my_quran/domain/entities/response/sura.dart';
import 'package:my_quran/domain/use_cases/list_interpretation_use_case.dart';

class InterpretationController extends GetxController {
  final ListInterpretationUseCase useCase;
  final NetworkInfoImpl networkInfo;

  InterpretationController({
    required this.useCase,
    required this.networkInfo,
  });

  Sura detail = Sura();

  final _listData = <Interpretation>[].obs;

  set listData(List<Interpretation> value) {
    _listData.clear();
    _listData.addAll(value);
  }

  List<Interpretation> get listData => _listData.toList();

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
        Sura sura = value.data;
        detail = detail.copyWith(interpretation: sura.interpretation);
        listData = detail.interpretation ?? [];
      },
    ).onError(
      (error, stackTrace) {
        //error response
        print("error: $error");
        print("stackTrace: $stackTrace");
      },
    );
  }
}

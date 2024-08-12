import 'package:my_quran/domain/entities/base/base_response.dart';

abstract class QuranRepository {
  Future<BaseResponse> listSura();

  Future<BaseResponse> listAya(
    num data,
  );

  Future<BaseResponse> listInterpretation(
    num data,
  );
}

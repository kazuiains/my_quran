import 'package:my_quran/app/core/use_cases/param_use_case.dart';
import 'package:my_quran/domain/entities/base/base_response.dart';
import 'package:my_quran/domain/repository/quran_repository.dart';

class ListAyaUseCase extends ParamUseCase<BaseResponse, num> {
  final QuranRepository _repo;

  ListAyaUseCase(this._repo);

  @override
  Future<BaseResponse> execute(params) {
    return _repo.listAya(params);
  }
}

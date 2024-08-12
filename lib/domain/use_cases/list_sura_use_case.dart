import 'package:my_quran/app/core/use_cases/no_param_use_case.dart';
import 'package:my_quran/domain/entities/base/base_response.dart';
import 'package:my_quran/domain/repository/quran_repository.dart';

class ListAyaUseCase extends NoParamUseCase<BaseResponse> {
  final QuranRepository _repo;

  ListAyaUseCase(this._repo);

  @override
  Future<BaseResponse> execute() {
    return _repo.listSura();
  }
}

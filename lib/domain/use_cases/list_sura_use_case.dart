import 'package:my_quran/app/core/use_cases/no_param_use_case.dart';
import 'package:my_quran/domain/entities/base/base_response.dart';
import 'package:my_quran/domain/repository/quran_repository.dart';

class ListSuraUseCase extends NoParamUseCase<BaseResponse> {
  final QuranRepository _repo;

  ListSuraUseCase(this._repo);

  @override
  Future<BaseResponse> execute() {
    return _repo.listSura();
  }
}

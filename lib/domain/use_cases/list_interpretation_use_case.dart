import 'package:my_quran/app/core/use_cases/param_use_case.dart';
import 'package:my_quran/domain/entities/base/base_response.dart';
import 'package:my_quran/domain/repository/quran_repository.dart';

class ListInterpretationUseCase extends ParamUseCase<BaseResponse, num> {
  final QuranRepository _repo;

  ListInterpretationUseCase(this._repo);

  @override
  Future<BaseResponse> execute(params) {
    return _repo.listInterpretation(params);
  }
}

import 'package:my_quran/data/models/base/base_response_model.dart';
import 'package:my_quran/data/models/response/sura_model.dart';
import 'package:my_quran/data/providers/network/api_data_source.dart';
import 'package:my_quran/data/providers/network/api_endpoint.dart';

abstract class QuranRemoteDataSource {
  Future<BaseResponseModel> listSura();

  Future<BaseResponseModel> listAya(
    num data,
  );

  Future<BaseResponseModel> listInterpretation(
    num data,
  );
}

class QuranRemoteDataSourceImpl extends ApiDataSource
    implements QuranRemoteDataSource {
  QuranRemoteDataSourceImpl({
    super.dio,
  });

  @override
  Future<BaseResponseModel> listSura() async {
    final response = await execute(
      urlPath: ApiEndpoint.sura,
    );

    return BaseResponseModel.fromJson(
      response,
      (json) => json is List && json.isNotEmpty
          ? json
              .map<SuraModel>(
                (i) => SuraModel.fromJson(i),
              )
              .toList()
          : [],
    );
  }

  @override
  Future<BaseResponseModel> listAya(data) async {
    final response = await execute(
      urlPath: "${ApiEndpoint.aya}/$data",
    );

    return BaseResponseModel.fromJson(
      response,
      (json) => SuraModel.fromJson(json),
    );
  }

  @override
  Future<BaseResponseModel> listInterpretation(data) async {
    final response = await execute(
      urlPath: "${ApiEndpoint.interpretation}/$data",
    );

    return BaseResponseModel.fromJson(
      response,
      (json) => SuraModel.fromJson(json),
    );
  }
}

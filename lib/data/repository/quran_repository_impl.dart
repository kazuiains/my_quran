import 'package:my_quran/app/core/network/network_info.dart';
import 'package:my_quran/data/providers/database/sources/quran_local_data_source.dart';
import 'package:my_quran/data/providers/network/sources/quran_remote_data_source.dart';
import 'package:my_quran/domain/entities/base/base_response.dart';
import 'package:my_quran/domain/repository/quran_repository.dart';

class QuranRepositoryImpl implements QuranRepository {
  final QuranRemoteDataSource remoteDataSource;
  final QuranLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  QuranRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<BaseResponse> listSura() async {
    bool isConnected = await networkInfo.isConnected;

    if (isConnected) {
      var response = await remoteDataSource.listSura();
      localDataSource.backupSura(
        response.data,
      );
      return response;
    } else {
      return localDataSource.listSura();
    }
  }

  @override
  Future<BaseResponse> listAya(data) async {
    bool isConnected = await networkInfo.isConnected;

    if (isConnected) {
      var response = await remoteDataSource.listAya(data);
      localDataSource.backupAya(
        response.data,
      );
      return response;
    } else {
      return localDataSource.listAya(data);
    }
  }

  @override
  Future<BaseResponse> listInterpretation(data) async {
    bool isConnected = await networkInfo.isConnected;

    if (isConnected) {
      var response = await remoteDataSource.listInterpretation(data);
      localDataSource.backupInterpretation(
        response.data,
      );
      return response;
    } else {
      return localDataSource.listInterpretation(data);
    }
  }
}

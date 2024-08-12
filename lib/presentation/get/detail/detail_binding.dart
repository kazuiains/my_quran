import 'package:get/get.dart';
import 'package:my_quran/app/core/network/network_info.dart';
import 'package:my_quran/data/providers/database/sources/quran_local_data_source.dart';
import 'package:my_quran/data/providers/network/sources/quran_remote_data_source.dart';
import 'package:my_quran/data/repository/quran_repository_impl.dart';
import 'package:my_quran/domain/use_cases/list_aya_use_case.dart';
import 'package:my_quran/presentation/get/detail/detail_controller.dart';
import 'package:sqflite/sqflite.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    _dataSource();
    _repository();
    _useCase();

    Get.put(
      DetailController(
        useCase: Get.find<ListAyaUseCase>(),
        networkInfo: Get.find<NetworkInfoImpl>(),
      ),
    );
  }

  _dataSource() {
    Get.lazyPut(() => QuranRemoteDataSourceImpl());
    Get.lazyPut(
      () => QuranLocalDataSourceImpl(
        database: Get.find<Database>(),
      ),
    );
  }

  _repository() {
    Get.lazyPut(
      () => QuranRepositoryImpl(
        remoteDataSource: Get.find<QuranRemoteDataSourceImpl>(),
        localDataSource: Get.find<QuranLocalDataSourceImpl>(),
        networkInfo: Get.find<NetworkInfoImpl>(),
      ),
    );
  }

  _useCase() {
    Get.lazyPut(
      () => ListAyaUseCase(
        Get.find<QuranRepositoryImpl>(),
      ),
    );
  }
}

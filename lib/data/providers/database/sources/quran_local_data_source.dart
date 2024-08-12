import 'package:my_quran/app/config/app_strings.dart';
import 'package:my_quran/app/utils/helper/query_helper.dart';
import 'package:my_quran/data/models/base/base_response_model.dart';
import 'package:my_quran/data/models/response/aya_model.dart';
import 'package:my_quran/data/models/response/interpretation_model.dart';
import 'package:my_quran/data/models/response/sura_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class QuranLocalDataSource {
  Future<bool> backupSura(
    List<SuraModel> data,
  );

  Future<bool> backupAya(
    SuraModel data,
  );

  Future<bool> backupInterpretation(
    SuraModel data,
  );

  Future<BaseResponseModel> listSura();

  Future<BaseResponseModel> listAya(
    num data,
  );

  Future<BaseResponseModel> listInterpretation(
    num data,
  );
}

class QuranLocalDataSourceImpl
    with QueryHelper
    implements QuranLocalDataSource {
  final Database database;

  QuranLocalDataSourceImpl({
    required this.database,
  });

  final suraTable = suraModelTableName;
  final ayaTable = ayaModelTableName;
  final interpretationTable = interpretationModelTableName;

  @override
  Future<bool> backupSura(data) async {
    try {
      var args = <String>[];

      for (var i in data) {
        if (i.number != null) {
          args.add("${i.number}");
        }
      }

      final response = await database.query(
        suraTable,
        where: whereStrIn(args.length, suraModelColumn2),
        whereArgs: args,
      );

      List<SuraModel> dataLocal = response.isNotEmpty
          ? response
              .map<SuraModel>(
                (i) => SuraModel.fromTable(i),
              )
              .toList()
          : [];

      Batch batch = database.batch();

      for (var i in data) {
        var items = dataLocal.where((model) => model.number == i.number);
        Map<String, dynamic> tableData = i.toTable();

        if (items.isEmpty) {
          batch.insert(
            suraTable,
            tableData,
          );
        } else {
          batch.update(
            suraTable,
            tableData,
            where: '$suraModelColumn2 = ?',
            whereArgs: [i.number],
          );
        }
      }

      await batch.commit(continueOnError: true, noResult: true);

      return true;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> backupAya(data) async {
    try {
      var aya = data.aya ?? [];

      var ayaArgs = <String>[];
      for (var i in aya) {
        if (i.number != null) {
          ayaArgs.add("${i.number}");
        }
      }

      var args = <String>[];
      args.addAll(ayaArgs);
      if (data.number != null) {
        args.add(data.number.toString());
      }

      final suraResponse = await database.query(
        suraTable,
        where: "$suraModelColumn2 = ?",
        whereArgs: [data.number],
      );

      final response = await database.query(
        ayaTable,
        where:
            "${whereStrIn(ayaArgs.length, ayaModelColumn2)} AND $ayaModelColumn7 = ?",
        whereArgs: args,
      );

      List<AyaModel> dataLocal = response.isNotEmpty
          ? response
              .map<AyaModel>(
                (i) => AyaModel.fromTable(i),
              )
              .toList()
          : [];

      Batch batch = database.batch();

      if (suraResponse.isNotEmpty) {
        SuraModel dataSuraLocal = SuraModel.fromTable(suraResponse.first);

        SuraModel newDataSuraLocal = SuraModel.fromEntity(
          dataSuraLocal.copyWith(
            nextSura: data.nextSura,
            prevSura: data.prevSura,
          ),
        );

        batch.update(
          suraTable,
          newDataSuraLocal.toTable(),
          where: '$ayaModelColumn7 = ?',
          whereArgs: [data.number],
        );
      } else {
        batch.insert(
          suraTable,
          data.toTable(),
        );
      }

      for (var i in aya) {
        var items = dataLocal.where((model) => model.number == i.number);
        Map<String, dynamic> tableData = AyaModel.fromEntity(i).toTable();

        if (items.isEmpty) {
          batch.insert(
            ayaTable,
            tableData,
          );
        } else {
          batch.update(
            ayaTable,
            tableData,
            where: '$ayaModelColumn2 = ? AND $ayaModelColumn7 = ?',
            whereArgs: [i.number, data.number],
          );
        }
      }

      await batch.commit(continueOnError: true, noResult: true);

      return true;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> backupInterpretation(data) async {
    try {
      var interpretation = data.interpretation ?? [];

      var interpretationArgs = <String>[];
      for (var i in interpretation) {
        if (i.aya != null) {
          interpretationArgs.add("${i.aya}");
        }
      }

      var args = <String>[];
      args.addAll(interpretationArgs);
      if (data.number != null) {
        args.add(data.number.toString());
      }

      final response = await database.query(
        interpretationTable,
        where:
            "${whereStrIn(interpretationArgs.length, interpretationModelColumn2)} AND $interpretationModelColumn4 = ?",
        whereArgs: args,
      );

      List<InterpretationModel> dataLocal = response.isNotEmpty
          ? response
              .map<InterpretationModel>(
                (i) => InterpretationModel.fromTable(i),
              )
              .toList()
          : [];

      Batch batch = database.batch();

      for (var i in interpretation) {
        var items = dataLocal.where((model) => model.aya == i.aya);
        Map<String, dynamic> tableData =
            InterpretationModel.fromEntity(i).toTable();

        if (items.isEmpty) {
          batch.insert(
            interpretationTable,
            tableData,
          );
        } else {
          batch.update(
            interpretationTable,
            tableData,
            where:
                '$interpretationModelColumn2 = ? AND $interpretationModelColumn4 = ?',
            whereArgs: [i.aya, data.aya],
          );
        }
      }

      await batch.commit(continueOnError: true, noResult: true);

      return true;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponseModel> listSura() async {
    try {
      final response = await database.query(
        suraTable,
      );

      var results = response.isNotEmpty
          ? response
              .map<SuraModel>(
                (i) => SuraModel.fromTable(i),
              )
              .toList()
          : [];

      return BaseResponseModel(
        code: int.parse(AppStrings.codeRetrievedSuccess),
        message: AppStrings.messageRetrievedSuccess,
        data: results,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponseModel> listAya(
    data,
  ) async {
    int suraNumber = data.toInt();

    try {
      final suraResponse = await database.query(
        suraTable,
        where: "$suraModelColumn2 = ?",
        whereArgs: [suraNumber],
      );

      final response = await database.query(
        ayaTable,
        where: "$ayaModelColumn7 = ?",
        whereArgs: [suraNumber],
      );

      List<AyaModel> ayaResults = response.isNotEmpty
          ? response
              .map<AyaModel>(
                (i) => AyaModel.fromTable(i),
              )
              .toList()
          : [];

      var result = suraResponse.isNotEmpty
          ? SuraModel.fromTable(suraResponse.first).copyWith(
              aya: ayaResults,
            )
          : SuraModel(
              aya: ayaResults,
            );

      return BaseResponseModel(
        code: int.parse(AppStrings.codeRetrievedSuccess),
        message: AppStrings.messageRetrievedSuccess,
        data: result,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponseModel> listInterpretation(
    data,
  ) async {
    int suraNumber = data.toInt();

    try {
      final suraResponse = await database.query(
        suraTable,
        where: "$suraModelColumn2 = ?",
        whereArgs: [suraNumber],
      );

      final response = await database.query(
        interpretationTable,
        where: "$interpretationModelColumn4 = ?",
        whereArgs: [suraNumber],
      );

      List<InterpretationModel> interpretationResults = response.isNotEmpty
          ? response
              .map<InterpretationModel>(
                (i) => InterpretationModel.fromTable(i),
              )
              .toList()
          : [];

      var result = suraResponse.isNotEmpty
          ? SuraModel.fromTable(suraResponse.first).copyWith(
              interpretation: interpretationResults,
            )
          : SuraModel(
              interpretation: interpretationResults,
            );

      return BaseResponseModel(
        code: int.parse(AppStrings.codeRetrievedSuccess),
        message: AppStrings.messageRetrievedSuccess,
        data: result,
      );
    } catch (_) {
      rethrow;
    }
  }
}

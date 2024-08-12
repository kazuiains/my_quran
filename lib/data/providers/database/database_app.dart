import 'package:my_quran/app/config/app_config.dart';
import 'package:my_quran/data/models/response/aya_model.dart';
import 'package:my_quran/data/models/response/interpretation_model.dart';
import 'package:my_quran/data/models/response/sura_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseApp {
  static String databaseName =
      "${AppConfig.instance!.appName.toLowerCase()}_local.db";

  static init({
    required Database database,
    required int version,
  }) async {
    var batch = database.batch();
    featureTable(batch);
    await batch.commit(continueOnError: true, noResult: true);
  }

  static featureTable(Batch batch) {
    batch.execute("CREATE TABLE $suraModelTableName "
        "("
        "$suraModelColumn1 INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "
        "$suraModelColumn2 INTEGER, "
        "$suraModelColumn3 TEXT, "
        "$suraModelColumn4 TEXT, "
        "$suraModelColumn5 INTEGER, "
        "$suraModelColumn6 TEXT, "
        "$suraModelColumn7 TEXT, "
        "$suraModelColumn8 TEXT, "
        "$suraModelColumn9 TEXT, "
        "$suraModelColumn10 TEXT, "
        "$suraModelColumn11 TEXT"
        ")");

    batch.execute("CREATE TABLE $ayaModelTableName "
        "("
        "$ayaModelColumn1 INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "
        "$ayaModelColumn2 INTEGER, "
        "$ayaModelColumn3 TEXT, "
        "$ayaModelColumn4 TEXT, "
        "$ayaModelColumn5 TEXT, "
        "$ayaModelColumn6 TEXT, "
        "$ayaModelColumn7 INTEGER"
        ")");

    batch.execute("CREATE TABLE $interpretationModelTableName "
        "("
        "$interpretationModelColumn1 INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "
        "$interpretationModelColumn1 INTEGER, "
        "$interpretationModelColumn1 TEXT, "
        "$interpretationModelColumn1 INTEGER"
        ")");
  }

  static upgrade({
    required Database database,
    required int version,
  }) async {
    var batch = database.batch();
    if (version < 2) {
      // update from ver 1
    }
    if (version < 3) {}
    if (version < 4) {}
    if (version < 5) {}
    if (version < 6) {}
    await batch.commit(continueOnError: true, noResult: true);
  }

// static _fromVer1({
//   required Batch batch,
// }) {}
}

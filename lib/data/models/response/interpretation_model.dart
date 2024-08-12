import 'dart:convert';

import 'package:my_quran/domain/entities/response/interpretation.dart';

InterpretationModel interpretationFromJson(String str) =>
    InterpretationModel.fromJson(json.decode(str));

String interpretationToJson(InterpretationModel data) =>
    json.encode(data.toJson());

const String interpretationModelTableName = 'Interpretation';
const String interpretationModelColumn1 = 'tableId';
const String interpretationModelColumn2 = 'aya';
const String interpretationModelColumn3 = 'text';
const String interpretationModelColumn4 = 'suraNumber';

class InterpretationModel extends Interpretation {
  InterpretationModel({
    super.tableId,
    super.aya,
    super.text,
    super.suraNumber,
  });

  _initFromEntity(Interpretation entity) {
    tableId = entity.tableId;
    aya = entity.aya;
    text = entity.text;
    suraNumber = entity.suraNumber;
  }

  InterpretationModel.fromDynamic(dynamic dynamicEntity) {
    var dataEntity = (dynamicEntity as Interpretation);
    _initFromEntity(dataEntity);
  }

  InterpretationModel.fromEntity(Interpretation entity) {
    _initFromEntity(entity);
  }

  InterpretationModel.fromJson(dynamic json) {
    if (json != null) {
      aya = json['ayat'];
      text = json['teks'];
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (aya != null) {
      map['ayat'] = aya;
    }
    if (text != null) {
      map['teks'] = text;
    }
    return map;
  }

  InterpretationModel.fromTable(dynamic json) {
    if (json != null) {
      tableId = json[interpretationModelColumn1];
      aya = json[interpretationModelColumn2];
      text = json[interpretationModelColumn3];
      suraNumber = json[interpretationModelColumn4];
    }
  }

  Map<String, dynamic> toTable() {
    final map = <String, dynamic>{};
    if (tableId != null) {
      map[interpretationModelColumn1] = tableId;
    }
    if (aya != null) {
      map[interpretationModelColumn2] = aya;
    }
    if (text != null) {
      map[interpretationModelColumn3] = text;
    }
    if (suraNumber != null) {
      map[interpretationModelColumn4] = suraNumber;
    }
    return map;
  }
}

import 'dart:convert';

import 'package:my_quran/data/models/response/audio_model.dart';
import 'package:my_quran/domain/entities/response/aya.dart';

AyaModel ayaFromJson(String str) => AyaModel.fromJson(json.decode(str));

String ayaToJson(AyaModel data) => json.encode(data.toJson());

const String ayaModelTableName = 'Aya';
const String ayaModelColumn1 = 'tableId';
const String ayaModelColumn2 = 'number';
const String ayaModelColumn3 = 'arabicText';
const String ayaModelColumn4 = 'latinText';
const String ayaModelColumn5 = 'indonesianText';
const String ayaModelColumn6 = 'audio';
const String ayaModelColumn7 = 'suraNumber';

class AyaModel extends Aya {
  AyaModel({
    super.tableId,
    super.number,
    super.arabicText,
    super.latinText,
    super.indonesianText,
    super.audio,
    super.suraNumber,
  });

  _initFromEntity(Aya entity) {
    tableId = entity.tableId;
    number = entity.number;
    arabicText = entity.arabicText;
    latinText = entity.latinText;
    indonesianText = entity.indonesianText;
    audio = entity.audio;
    suraNumber = entity.suraNumber;
  }

  AyaModel.fromDynamic(dynamic dynamicEntity) {
    var dataEntity = (dynamicEntity as Aya);
    _initFromEntity(dataEntity);
  }

  AyaModel.fromEntity(Aya entity) {
    _initFromEntity(entity);
  }

  AyaModel.fromJson(dynamic json) {
    if (json != null) {
      number = json['nomorAyat'];
      arabicText = json['teksArab'];
      latinText = json['teksLatin'];
      indonesianText = json['teksIndonesia'];
      audio = json['audio'] != null ? AudioModel.fromJson(json['audio']) : null;
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (number != null) {
      map['nomorAyat'] = number;
    }
    if (arabicText != null) {
      map['teksArab'] = arabicText;
    }
    if (latinText != null) {
      map['teksLatin'] = latinText;
    }
    if (indonesianText != null) {
      map['teksIndonesia'] = indonesianText;
    }
    if (audio != null) {
      map['audio'] = AudioModel.fromEntity(audio!).toJson();
    }
    return map;
  }

  AyaModel.fromTable(dynamic json) {
    if (json != null) {
      tableId = json[ayaModelColumn1];
      number = json[ayaModelColumn2];
      arabicText = json[ayaModelColumn3];
      latinText = json[ayaModelColumn4];
      indonesianText = json[ayaModelColumn5];
      audio = AudioModel.fromJson(jsonDecode(json[ayaModelColumn6]));
      suraNumber = json[ayaModelColumn7];
    }
  }

  Map<String, dynamic> toTable() {
    final map = <String, dynamic>{};
    if (tableId != null) {
      map[ayaModelColumn1] = tableId;
    }
    if (number != null) {
      map[ayaModelColumn2] = number;
    }
    if (arabicText != null) {
      map[ayaModelColumn3] = arabicText;
    }
    if (latinText != null) {
      map[ayaModelColumn4] = latinText;
    }
    if (indonesianText != null) {
      map[ayaModelColumn5] = indonesianText;
    }
    if (audio != null) {
      map[ayaModelColumn6] = jsonEncode(AudioModel.fromEntity(audio!).toJson());
    }
    if (suraNumber != null) {
      map[ayaModelColumn7] = suraNumber;
    }
    return map;
  }
}

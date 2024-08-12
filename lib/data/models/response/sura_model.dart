import 'dart:convert';

import 'package:my_quran/data/models/response/audio_model.dart';
import 'package:my_quran/data/models/response/aya_model.dart';
import 'package:my_quran/data/models/response/interpretation_model.dart';
import 'package:my_quran/domain/entities/response/sura.dart';

SuraModel suraFromJson(String str) => SuraModel.fromJson(json.decode(str));

String suraToJson(SuraModel data) => json.encode(data.toJson());

const String suraModelTableName = 'Sura';
const String suraModelColumn1 = 'tableId';
const String suraModelColumn2 = 'number';
const String suraModelColumn3 = 'name';
const String suraModelColumn4 = 'nameLatin';
const String suraModelColumn5 = 'numberOfVerses';
const String suraModelColumn6 = 'dropOffPlace';
const String suraModelColumn7 = 'translation';
const String suraModelColumn8 = 'description';
const String suraModelColumn9 = 'audio';
const String suraModelColumn10 = 'nextSura';
const String suraModelColumn11 = 'prevSura';

class SuraModel extends Sura {
  SuraModel({
    super.tableId,
    super.number,
    super.name,
    super.nameLatin,
    super.numberOfVerses,
    super.dropOffPlace,
    super.translation,
    super.description,
    super.audio,
    super.aya,
    super.interpretation,
    super.nextSura,
    super.prevSura,
  });

  _initFromEntity(Sura entity) {
    tableId = entity.tableId;
    number = entity.number;
    name = entity.name;
    nameLatin = entity.nameLatin;
    numberOfVerses = entity.numberOfVerses;
    dropOffPlace = entity.dropOffPlace;
    translation = entity.translation;
    description = entity.description;
    audio = entity.audio;
    aya = entity.aya;
    interpretation = entity.interpretation;
    nextSura = entity.nextSura;
    prevSura = entity.prevSura;
  }

  SuraModel.fromDynamic(dynamic dynamicEntity) {
    var dataEntity = (dynamicEntity as Sura);
    _initFromEntity(dataEntity);
  }

  SuraModel.fromEntity(Sura entity) {
    _initFromEntity(entity);
  }

  SuraModel.fromJson(dynamic json) {
    if (json != null) {
      number = json['nomor'];
      name = json['nama'];
      nameLatin = json['namaLatin'];
      numberOfVerses = json['jumlahAyat'];
      dropOffPlace = json['tempatTurun'];
      translation = json['arti'];
      description = json['deskripsi'];
      audio = json['audioFull'] != null
          ? AudioModel.fromJson(json['audioFull'])
          : null;
      if (json['ayat'] != null) {
        aya = [];
        json['ayat'].forEach((v) {
          aya?.add(AyaModel.fromJson(v));
        });
      }
      if (json['tafsir'] != null) {
        interpretation = [];
        json['tafsir'].forEach((v) {
          interpretation?.add(InterpretationModel.fromJson(v));
        });
      }
      nextSura = json['suratSelanjutnya'] != null
          ? SuraModel.fromJson(json['suratSelanjutnya'])
          : null;
      prevSura = json['suratSebelumnya'] != null
          ? SuraModel.fromJson(json['suratSebelumnya'])
          : null;
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (number != null) {
      map['nomor'] = number;
    }
    if (name != null) {
      map['nama'] = name;
    }
    if (nameLatin != null) {
      map['namaLatin'] = nameLatin;
    }
    if (numberOfVerses != null) {
      map['jumlahAyat'] = numberOfVerses;
    }
    if (dropOffPlace != null) {
      map['tempatTurun'] = dropOffPlace;
    }
    if (translation != null) {
      map['arti'] = translation;
    }
    if (description != null) {
      map['deskripsi'] = description;
    }
    if (audio != null) {
      map['audioFull'] = AudioModel.fromEntity(audio!).toJson();
    }
    if (aya != null) {
      map['ayat'] = aya?.map((v) => AyaModel.fromEntity(v).toJson()).toList();
    }
    if (interpretation != null) {
      map['tafsir'] = interpretation
          ?.map((v) => InterpretationModel.fromEntity(v).toJson())
          .toList();
    }
    if (nextSura != null) {
      map['suratSelanjutnya'] = SuraModel.fromEntity(nextSura!).toJson();
    }
    if (prevSura != null) {
      map['suratSebelumnya'] = SuraModel.fromEntity(prevSura!).toJson();
    }
    return map;
  }

  SuraModel.fromTable(dynamic json) {
    if (json != null) {
      tableId = json[suraModelColumn1];
      number = json[suraModelColumn2];
      name = json[suraModelColumn3];
      nameLatin = json[suraModelColumn4];
      numberOfVerses = json[suraModelColumn5];
      dropOffPlace = json[suraModelColumn6];
      translation = json[suraModelColumn7];
      description = json[suraModelColumn8];
      audio = AudioModel.fromJson(jsonDecode(json[suraModelColumn9]));
      nextSura = SuraModel.fromJson(jsonDecode(json[suraModelColumn10]));
      prevSura = SuraModel.fromJson(jsonDecode(json[suraModelColumn11]));
    }
  }

  Map<String, dynamic> toTable() {
    final map = <String, dynamic>{};
    if (tableId != null) {
      map[suraModelColumn1] = tableId;
    }
    if (number != null) {
      map[suraModelColumn2] = number;
    }
    if (name != null) {
      map[suraModelColumn3] = name;
    }
    if (nameLatin != null) {
      map[suraModelColumn4] = nameLatin;
    }
    if (numberOfVerses != null) {
      map[suraModelColumn5] = numberOfVerses;
    }
    if (dropOffPlace != null) {
      map[suraModelColumn6] = dropOffPlace;
    }
    if (translation != null) {
      map[suraModelColumn7] = translation;
    }
    if (description != null) {
      map[suraModelColumn8] = description;
    }
    if (audio != null) {
      map[suraModelColumn9] =
          jsonEncode(AudioModel.fromEntity(audio!).toJson());
    }
    if (nextSura != null) {
      map[suraModelColumn10] =
          jsonEncode(SuraModel.fromEntity(nextSura!).toJson());
    }
    if (prevSura != null) {
      map[suraModelColumn11] =
          jsonEncode(SuraModel.fromEntity(prevSura!).toJson());
    }
    return map;
  }
}

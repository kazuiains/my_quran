import 'dart:convert';

import 'package:my_quran/domain/entities/response/audio.dart';

AudioModel audioFromJson(String str) => AudioModel.fromJson(json.decode(str));

String audioToJson(AudioModel data) => json.encode(data.toJson());

class AudioModel extends Audio {
  AudioModel({
    super.voice1,
    super.voice2,
    super.voice3,
    super.voice4,
    super.voice5,
  });

  _initFromEntity(Audio entity) {
    voice1 = entity.voice1;
    voice2 = entity.voice2;
    voice3 = entity.voice3;
    voice4 = entity.voice4;
    voice5 = entity.voice5;
  }

  AudioModel.fromDynamic(dynamic dynamicEntity) {
    var dataEntity = (dynamicEntity as Audio);
    _initFromEntity(dataEntity);
  }

  AudioModel.fromEntity(Audio entity) {
    _initFromEntity(entity);
  }

  AudioModel.fromJson(dynamic json) {
    if (json != null) {
      voice1 = json['01'];
      voice2 = json['02'];
      voice3 = json['03'];
      voice4 = json['04'];
      voice5 = json['05'];
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (voice1 != null) {
      map['01'] = voice1;
    }
    if (voice2 != null) {
      map['02'] = voice2;
    }
    if (voice3 != null) {
      map['03'] = voice3;
    }
    if (voice4 != null) {
      map['04'] = voice4;
    }
    if (voice5 != null) {
      map['05'] = voice5;
    }
    return map;
  }
}

import 'package:my_quran/domain/entities/response/audio.dart';

class Aya {
  num? tableId;
  num? number;
  String? arabicText;
  String? latinText;
  String? indonesianText;
  Audio? audio;
  num? suraNumber;

  Aya({
    this.tableId,
    this.number,
    this.arabicText,
    this.latinText,
    this.indonesianText,
    this.audio,
    this.suraNumber,
  });

  Aya copyWith({
    num? tableId,
    num? number,
    String? arabicText,
    String? latinText,
    String? indonesianText,
    Audio? audio,
    num? suraNumber,
  }) =>
      Aya(
        tableId: tableId ?? this.tableId,
        number: number ?? this.number,
        arabicText: arabicText ?? this.arabicText,
        latinText: latinText ?? this.latinText,
        indonesianText: indonesianText ?? this.indonesianText,
        audio: audio ?? this.audio,
        suraNumber: suraNumber ?? this.suraNumber,
      );
}

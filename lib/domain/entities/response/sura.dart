import 'package:my_quran/domain/entities/response/audio.dart';
import 'package:my_quran/domain/entities/response/aya.dart';
import 'package:my_quran/domain/entities/response/interpretation.dart';

class Sura {
  num? tableId;
  num? number;
  String? name;
  String? nameLatin;
  num? numberOfVerses;
  String? dropOffPlace;
  String? translation;
  String? description;
  Audio? audio;
  List<Aya>? aya;
  List<Interpretation>? interpretation;
  Sura? nextSura;
  Sura? prevSura;

  Sura({
    this.tableId,
    this.number,
    this.name,
    this.nameLatin,
    this.numberOfVerses,
    this.dropOffPlace,
    this.translation,
    this.description,
    this.audio,
    this.aya,
    this.interpretation,
    this.nextSura,
    this.prevSura,
  });

  Sura copyWith({
    num? tableId,
    num? number,
    String? name,
    String? nameLatin,
    num? numberOfVerses,
    String? dropOffPlace,
    String? translation,
    String? description,
    Audio? audio,
    List<Aya>? aya,
    List<Interpretation>? interpretation,
    Sura? nextSura,
    Sura? prevSura,
  }) =>
      Sura(
        tableId: tableId ?? this.tableId,
        number: number ?? this.number,
        name: name ?? this.name,
        nameLatin: nameLatin ?? this.nameLatin,
        numberOfVerses: numberOfVerses ?? this.numberOfVerses,
        dropOffPlace: dropOffPlace ?? this.dropOffPlace,
        translation: translation ?? this.translation,
        description: description ?? this.description,
        audio: audio ?? this.audio,
        aya: aya ?? this.aya,
        interpretation: interpretation ?? this.interpretation,
        nextSura: nextSura ?? this.nextSura,
        prevSura: prevSura ?? this.prevSura,
      );
}

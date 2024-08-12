class Interpretation {
  num? tableId;
  num? aya;
  String? text;
  num? suraNumber;

  Interpretation({
    this.tableId,
    this.aya,
    this.text,
    this.suraNumber,
  });

  Interpretation copyWith({
    num? tableId,
    num? aya,
    String? text,
    num? suraNumber,
  }) =>
      Interpretation(
          tableId: tableId ?? this.tableId,
          aya: aya ?? this.aya,
          text: text ?? this.text,
          suraNumber: suraNumber ?? this.suraNumber);
}

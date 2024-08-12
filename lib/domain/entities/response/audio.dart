class Audio {
  String? voice1;
  String? voice2;
  String? voice3;
  String? voice4;
  String? voice5;

  Audio({
    this.voice1,
    this.voice2,
    this.voice3,
    this.voice4,
    this.voice5,
  });

  Audio copyWith({
    String? voice1,
    String? voice2,
    String? voice3,
    String? voice4,
    String? voice5,
  }) =>
      Audio(
        voice1: voice1 ?? this.voice1,
        voice2: voice2 ?? this.voice2,
        voice3: voice3 ?? this.voice3,
        voice4: voice4 ?? this.voice4,
        voice5: voice5 ?? this.voice5,
      );
}

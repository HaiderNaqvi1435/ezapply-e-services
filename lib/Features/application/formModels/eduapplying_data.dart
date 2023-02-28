class EDUAPPLYINGDATA {
  String? university, programtitle;

  EDUAPPLYINGDATA({
    this.university,
    this.programtitle,
  });

  Map<String, dynamic> toMap() {
    return {
      'university': university,
      'programtitle': programtitle,
    };
  }

  EDUAPPLYINGDATA.fromMap(Map<String, dynamic> map)
      : university = map["university"],
        programtitle = map["programtitle"];

  fromMap(param0) {}
}

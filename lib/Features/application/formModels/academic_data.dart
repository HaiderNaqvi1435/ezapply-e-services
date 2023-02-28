class ACADEMICDATA {
  String? examination, board, passingyear, rollno, obtainmarks, totalmarks;

  ACADEMICDATA({
    this.examination,
    this.board,
    this.passingyear,
    this.rollno,
    this.obtainmarks,
    this.totalmarks,
  });

  Map<String, dynamic> toMap() {
    return {
      'examination': examination,
      'board': board,
      'passingyear': passingyear,
      'rollno': rollno,
      'obtainmarks': obtainmarks,
      'totalmarks': totalmarks,
    };
  }

  ACADEMICDATA.fromMap(Map<String, dynamic> map)
      : examination = map["examination"],
        board = map["board"],
        passingyear = map["passingyear"],
        rollno = map["rollno"],
        obtainmarks = map["obtainmarks"],
        totalmarks = map["totalmarks"];
}

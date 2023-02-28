class PERSONALDATA {
  String? name, fathername, cnic, fathercnic, gender, dob, religion;

  PERSONALDATA(
      {this.name,
      this.fathername,
      this.cnic,
      this.fathercnic,
      this.gender,
      this.dob,
      this.religion});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'fathername': fathername,
      'cnic': cnic,
      'fathercnic': fathercnic,
      'gender': gender,
      'dob': dob,
      'religion': religion,
    };
  }

  PERSONALDATA.fromMap(Map<String, dynamic> map)
      : name = map["name"],
        fathername = map["fathername"],
        cnic = map["cnic"],
        fathercnic = map["fathercnic"],
        gender = map["gender"],
        dob = map["dob"],
        religion = map["religion"];
}

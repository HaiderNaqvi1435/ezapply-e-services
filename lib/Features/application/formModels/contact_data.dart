class CONTACTDATA {
  String? phone, fatherphone, email, nationality, domicile, address;

  CONTACTDATA({
    this.phone,
    this.fatherphone,
    this.email,
    this.nationality,
    this.domicile,
    this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'phone': phone,
      'fatherphone': fatherphone,
      'email': email,
      'nationality': nationality,
      'domicile': domicile,
      'address': address,
    };
  }

  CONTACTDATA.fromMap(Map<String, dynamic> map)
      : phone = map["phone"],
        fatherphone = map["fatherphone"],
        email = map["email"],
        nationality = map["nationality"],
        domicile = map["domicile"],
        address = map["address"];
}

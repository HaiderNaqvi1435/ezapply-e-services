class USERDATA {
  String? username, useremail, token;
  USERDATA({this.username, this.useremail, this.token});

  Map<String, Object?> toMap() {
    return {
      "username": username,
      "useremail": useremail,
      "token": token,
    };
  }

  USERDATA.fromMap(Map<String, dynamic> map)
      : username = map["username"],
        useremail = map["useremail"],
        token = map["token"];
}

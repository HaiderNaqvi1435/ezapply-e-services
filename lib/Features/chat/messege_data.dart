import 'package:cloud_firestore/cloud_firestore.dart';

class MESSAGEDATA {
  String msg;
  Timestamp dateTime;
  bool isSentbyme;

  MESSAGEDATA(
      {required this.msg, required this.dateTime, required this.isSentbyme});

  Map<String, dynamic> toMap() {
    return {
      "msg": msg,
      "dateTime": dateTime,
      "isSentbyme": isSentbyme,
    };
  }

  MESSAGEDATA.fromMap(Map<String, dynamic> map)
      : msg = map["msg"],
        dateTime = map["dateTime"],
        isSentbyme = map["isSentbyme"];
}

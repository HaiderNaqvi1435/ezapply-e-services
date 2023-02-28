import 'package:cloud_firestore/cloud_firestore.dart';

class NEWSDATA {
  String? title, description, banner;
  DocumentReference? reff;
  NEWSDATA({this.title, this.reff, this.description, this.banner});

  Map<String, Object?> toMap() {
    return {
      "title": title,
      "description": description,
      "banner": banner,
    };
  }

  NEWSDATA.fromMap(Map<String, dynamic> map)
      : title = map["title"],
        description = map["description"],
        banner = map["banner"];
}

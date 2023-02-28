import 'dart:io';

class DOCUMENTDATA {
  String? documnetTitle, documnetUrl;
  File? documnetfile;
  DOCUMENTDATA({this.documnetTitle, this.documnetUrl});

  Map<String, dynamic> toMap() {
    return {
      'documnetTitle': documnetTitle,
      'documnetUrl': documnetUrl,
    };
  }

  DOCUMENTDATA.fromMap(Map<String, dynamic> map)
      : documnetTitle = map["documnetTitle"],
        documnetUrl = map["documnetUrl"];
}

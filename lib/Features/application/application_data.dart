import 'formModels/academic_data.dart';
import 'formModels/contact_data.dart';
import 'formModels/document_data.dart';
import 'formModels/eduapplying_data.dart';
import 'formModels/personal_data.dart';

class APPLICATIONDATA {
  String? applicationfor, applicationstatus, userID;
  DateTime? dateTime;
  EDUAPPLYINGDATA? eduapplyingdata = EDUAPPLYINGDATA();
  PERSONALDATA? personaldata = PERSONALDATA();
  CONTACTDATA? contactdata = CONTACTDATA();
  List<DOCUMENTDATA>? documentdata = [];
  List<ACADEMICDATA>? academicdata = [];
  APPLICATIONDATA({
    this.applicationfor,
    this.userID,
    this.applicationstatus,
    this.dateTime,
    this.eduapplyingdata,
    this.personaldata,
    this.contactdata,
    this.academicdata,
    this.documentdata,
  });

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'applicationfor': applicationfor,
      'applicationstatus': applicationstatus,
      'dateTime': dateTime,
      'eduapplyingdata':
          eduapplyingdata != null ? eduapplyingdata!.toMap() : null,
      'personaldata': personaldata != null ? personaldata!.toMap() : null,
      'contactdata': contactdata != null ? contactdata!.toMap() : null,
      'academicdata': academicdata != null
          ? academicdata!.map((e) => e.toMap()).toList()
          : null,
      'documentdata': documentdata != null
          ? documentdata!.map((e) => e.toMap()).toList()
          : null,
    };
  }

  APPLICATIONDATA.fromMap(Map<String, dynamic> map)
      : applicationfor = map["applicationfor"],
        userID = map["userID"],
        dateTime = map["dateTime"],
        applicationstatus = map["applicationstatus"],
        eduapplyingdata = map["eduapplyingdata"] == null
            ? null
            : EDUAPPLYINGDATA.fromMap(map["eduapplyingdata"]),
        personaldata = PERSONALDATA.fromMap(map["personaldata"]),
        academicdata = map["academicdata"] != null
            ? map["academicdata"]
                .map<ACADEMICDATA>((value) => ACADEMICDATA.fromMap(value))
                .toList()
            : null,
        documentdata = map["documentdata"] != null
            ? map["documentdata"]
                .map<DOCUMENTDATA>((value) => DOCUMENTDATA.fromMap(value))
                .toList()
            : null;
}

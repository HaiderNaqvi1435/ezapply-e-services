import 'package:flutter/material.dart';

import '../../main.dart';
import '../application/createapplication/applicationForm.dart';

class ServicesManager with ChangeNotifier {
  BuildContext context = navigatorKey.currentContext!;

  movetoform() async {
    // AdmissionModel admissionModel =
    //     AdmissionModel(applicationfor: "duplicate", cnic: "453333335");
    // await FirebaseFirestore.instance
    //     .collection("Application")
    //     .add(admissionModel.toMap())
    //     .then((value) => print("Uploaded"));
    // print(admissionModel.applicationfor);
    // print(admissionModel.cnic);
    // print(admissionModel.status);

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ApplicationForm(),
        ));
  }
}

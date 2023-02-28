import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_stepper/cool_stepper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../Shared/utils.dart';
import '../../main.dart';
import 'application_data.dart';
import 'createapplication/infoWidgets.dart';
import 'formModels/contact_data.dart';
import 'formModels/document_data.dart';
import 'formModels/eduapplying_data.dart';
import 'formModels/personal_data.dart';

class ApplicationManager with ChangeNotifier {
  FormsManager() {
    getApplicationData();
  }

  List<APPLICATIONDATA> applicationdatalist = [];
  List<DOCUMENTDATA> docslist = [];

  getApplicationData() async {
    FirebaseFirestore.instance
        .collection("Applications")
        .where("userID", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then(
      (value) {
        applicationdatalist = List.generate(value.size, (index) {
          APPLICATIONDATA applicationdata =
              APPLICATIONDATA.fromMap(value.docs[index].data());
          return applicationdata;
        });
        notifyListeners();
      },
    );

    // print(applicationdatalist[0].academicdata!.map((e) => e.board));
    // print(
    //     "application .....${applicationdatalist.map((e) => e.applicationfor)}");
    // print("name.....${applicationdatalist.map((e) => e.personaldata!.name)}");
  }

  generateDocs() async {
    for (var i = 0; i < docslist.length; i++) {
      final task = await FirebaseStorage.instance
          .ref('Applications')
          .child(DateTime.now().microsecondsSinceEpoch.toString())
          .putFile(docslist[i].documnetfile!);
      docslist[i].documnetUrl = await task.ref.getDownloadURL();
      print("profile url ${docslist[i].documnetUrl}");
    }
  }

  submitApplication() async {
    PERSONALDATA personaldata = PERSONALDATA(
        cnic: cniccont.text,
        name: namecont.text,
        dob: dobcont.text,
        fathercnic: fthrcniccont.text,
        fathername: fthrnamecont.text,
        gender: gendercont.text,
        religion: religioncont.text);
    CONTACTDATA contactdata = CONTACTDATA(
        address: addresscont.text,
        domicile: domicilecont.text,
        email: emailcont.text,
        fatherphone: fthrphonecont.text,
        nationality: nationalitycont.text,
        phone: phonecont.text);
    EDUAPPLYINGDATA eduapplyingdata = EDUAPPLYINGDATA(
        programtitle: programcont.text, university: unicont.text);
    Future.delayed(
      const Duration(milliseconds: 10),
      () {
        generateDocs();
      },
    ).then((value) async {
      APPLICATIONDATA applicationdata = APPLICATIONDATA(
        userID: FirebaseAuth.instance.currentUser!.uid,
        personaldata: personaldata,
        contactdata: contactdata,
        eduapplyingdata: eduapplyingdata,
        dateTime: DateTime.now(),
        // academicdata: academic,
        documentdata: docslist,
        // applicationfor: applicatio,
      );

      await FirebaseFirestore.instance
          .collection("Applications")
          .add(applicationdata.toMap())
          .then((value) {
        getApplicationData();
        print("Uploadeddddddd");
      });
    });
  }

  List<CoolStep> getSteps() {
    final colorss = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;
    return [
      CoolStep(
          title: "Personal Info",
          subtitle: "Please enter Personal Info",
          content: getpersonalInfo(colorss),
          validation: () {
            return null;
          }),
      CoolStep(
          title: "Contact Info",
          subtitle: "Please enter Contact Info",
          content: getcontactInfo(colorss),
          validation: () {
            return null;
          }),
      CoolStep(
          title: "Academic Info",
          subtitle: "Please enter Academic Info",
          content: getacademicInfo(),
          validation: () {
            return null;
          }),
      CoolStep(
          title: "Applying Info",
          subtitle:
              "Enter University name and Program that you are applying for.",
          content: getapplyingInfo(colorss),
          validation: () {
            return null;
          }),
      CoolStep(
          title: "Kindly upload the following documents",
          subtitle:
              "Picture(Blue Background) , ID card , Matric & Inter Result Cards , Domicile...",
          content: getDocs(colorss, size),
          validation: () {
            if (docslist.isEmpty) {
              return "Please Upload Required Documnets";
            }
            return null;
          }),
    ];
  }

  BuildContext context = navigatorKey.currentContext!;

  ///textfield controllerss//////
  TextEditingController namecont = TextEditingController();
  TextEditingController fthrnamecont = TextEditingController();
  TextEditingController cniccont = TextEditingController();
  TextEditingController fthrcniccont = TextEditingController();
  TextEditingController gendercont = TextEditingController();
  TextEditingController dobcont = TextEditingController();
  TextEditingController religioncont = TextEditingController();
  ////contact info controllers///////
  TextEditingController phonecont = TextEditingController();
  TextEditingController fthrphonecont = TextEditingController();
  TextEditingController emailcont = TextEditingController();
  TextEditingController nationalitycont = TextEditingController();
  TextEditingController domicilecont = TextEditingController();
  TextEditingController addresscont = TextEditingController();
  //////applying info controllers////
  TextEditingController unicont = TextEditingController();
  TextEditingController programcont = TextEditingController();

  ///documents list////
  TextEditingController doctitle = TextEditingController();
  File? docfile;
  pickdoc() async {
    // docimage = null;
    docfile = await pickImage();
    notifyListeners();
  }

  addDoctoList() async {
    try {
      DOCUMENTDATA documentdata = DOCUMENTDATA();
      if (docfile != null) {
        documentdata.documnetfile = docfile;
        documentdata.documnetTitle = doctitle.text;

        print("Doctile = ${documentdata.documnetTitle}");
        docfile = null;
        doctitle.clear();
        docslist.add(documentdata);
        notifyListeners();
      } else {
        print("Someting went wrong");
      }
    } catch (e) {}
  }

  deleteDocfromList(int index) {
    docslist.removeAt(index);
    notifyListeners();
  }
}

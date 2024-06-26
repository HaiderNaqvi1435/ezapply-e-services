import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Shared/navbar.dart';
import '../../main.dart';
import 'verifyemail.dart';
import 'login.dart';
import 'user_data.dart';

class AuthManager with ChangeNotifier {
  AuthManager() {
    getUserdata();
  }
  TextEditingController unamecont = TextEditingController();
  TextEditingController uemailcont = TextEditingController();
  TextEditingController passcont = TextEditingController();
  BuildContext context = navigatorKey.currentContext!;
  bool _lodign = false;
  bool _ischlecked = false;
  bool get loding => _lodign;
  setloading(bool value) {
    _lodign = value;
    notifyListeners();
  }

  bool get checked => _ischlecked;
  setchecked(bool ischlecked) {
    _ischlecked = ischlecked;
    notifyListeners();
  }

  USERDATA userdata = USERDATA();
  static isLogined() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MyNavBar();
        } else {
          return  Loginpage();
        }
      },
    );
  }

  getUserdata() async {
    if (FirebaseAuth.instance.currentUser == null) return;
    await FirebaseFirestore.instance
        .collection("UserData")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .get()
        .then((value) {
      userdata = USERDATA.fromMap(value.data()!);
      print(userdata.username);
      notifyListeners();
    });
  }

  userSignup() async {
    setloading(true);
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: uemailcont.text.trim().toLowerCase(),
              password: passcont.text)
          .then((value) async {
        setloading(false);

        USERDATA userdata = USERDATA(
          username: unamecont.text,
          useremail: uemailcont.text,
        );
        await FirebaseFirestore.instance
            .collection("UserData")
            .doc(value.user!.email)
            .set(userdata.toMap())
            .then((value) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => VerifyEmail(),
              ));
//  Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => Loginpage(),
//                 )));
        });

        unamecont.clear();
        uemailcont.clear();
        passcont.clear();
        setloading(false);

        // notifyListeners();
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      print('eeee$e');
      setloading(false);
    }
  }

  userLogin() async {
    setloading(true);
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: uemailcont.text.trim().toLowerCase(),
              password: passcont.text)
          .then((value) async {
        setloading(false);

        await getUserdata();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MyNavBar(),
            ));
        print(value.user!.email);
        print("logged in");
        uemailcont.clear();
        passcont.clear();
        setloading(false);

        notifyListeners();
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));

      print('eeee$e');
      setloading(false);
    }
  }

  userSignout() async {
    FirebaseAuth.instance.signOut().then((value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Loginpage(),
        )));
  }

  resetpasswordemail() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: uemailcont.text.toLowerCase().trim()).then((value) =>  ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Email sent successfully!"))));
     
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      Navigator.of(context).pop();
    }
  }
}

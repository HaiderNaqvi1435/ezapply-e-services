import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'messege_data.dart';

class ChatManager with ChangeNotifier {
  TextEditingController controller = TextEditingController();
  ChatManager() {
    getMessage();
  }
  List<MESSAGEDATA> messageList = [];

  sendMessage() async {
    MESSAGEDATA messagedata = MESSAGEDATA(
        msg: controller.text, dateTime: Timestamp.now(), isSentbyme: true);

    await FirebaseFirestore.instance
        .collection("UserData")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("ChatBox")
        .add(messagedata.toMap())
        .then((value) {
      print("message sent");
      controller.clear();
      getMessage();
      notifyListeners();
    });
  }

  getMessage() async {
    FirebaseFirestore.instance
        .collection("UserData")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("ChatBox")
        .snapshots()
        .listen((message) {
      messageList = List.generate(message.size, (index) {
        MESSAGEDATA messagedata =
            MESSAGEDATA.fromMap(message.docs[index].data());

        return messagedata;
      });
      print("message got");
      notifyListeners();
    });

    // });
    //     .then((value) {
    //
  }
}
// MESSAGEDATA(
//       msg: "Hi",
//       dateTime: DateTime.now().subtract(Duration(days: 3, minutes: 1)),
//       isSentbyme: true),
//   MESSAGEDATA(
//       msg: "Hello",
//       dateTime: DateTime.now().subtract(Duration(days: 2, minutes: 2)),
//       isSentbyme: false),
//   MESSAGEDATA(
//       msg: "how are you",
//       dateTime: DateTime.now().subtract(Duration(days: 1, minutes: 60)),
//       isSentbyme: true),
//   MESSAGEDATA(
//       msg: "I'm Good",
//       dateTime: DateTime.now().subtract(Duration(minutes: 40)),
//       isSentbyme: false),
//   MESSAGEDATA(
//       msg: "Okay",
//       dateTime: DateTime.now().subtract(Duration(minutes: 20)),
//       isSentbyme: true),

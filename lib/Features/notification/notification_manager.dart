import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

Future<void> backgroundnotification(RemoteMessage message) async {
  log(message.notification!.title.toString());
}

class NotifcationManager with ChangeNotifier {
  NotifcationManager() {
    print("constrantor callaed");

    setupInteractedMessage();
    setupToken();
    // getMessage();
    // getInitializeMessage();
  }
  int currentIndex = 0;
  List<RemoteNotification> messagelist = [];
  Future<void> saveTokenToDatabase(String token) async {
    // Assume user is logged in for this example
    String userId = FirebaseAuth.instance.currentUser!.uid;

    FirebaseFirestore.instance.collection('users').doc(userId).update({
      'token': FieldValue.arrayUnion([token]),
    });
  }

  Future<void> setupToken() async {
    // Get the token each time the application loads
    String? token = await FirebaseMessaging.instance.getToken();

    // Save the initial token to the database
    saveTokenToDatabase(token!);

    // Any time the token refreshes, store this in the database too.
    FirebaseMessaging.instance.onTokenRefresh.listen(saveTokenToDatabase);
  }

  void getIndex(int value) {
    currentIndex = value;
    notifyListeners();
  }

  static Future<void> initialize() async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      badge: true,
      alert: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("notification permission granted");

      // FirebaseMessaging.onBackgroundMessage(backgroundnotification);
      // String? token = await FirebaseMessaging.instance.getToken();
      // if (token != null) {
      //   log(token);
      // }
      // FirebaseMessaging.onMessage.listen((message) async {});
    } else {
      print("notification permission not granted");
    }
  }

  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
    FirebaseMessaging.onBackgroundMessage(backgroundnotification);
  }

  void _handleMessage(RemoteMessage message) {
    if (message.data['page'] == 'notification') {
      currentIndex = 3;
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        RemoteNotification? notification = message.notification;

        // If `onMessage` is triggered with a notification, construct our own
        // local notification to show to users using the created channel.
        if (notification != null) {
          messagelist.add(notification);
          notifyListeners();
          print("hello");
          print(messagelist.map((e) => e.title));
        }
      });
      notifyListeners();
    }
  }

  // getMessage() async {
  //   print("get message called");

  // }
  // void getInitializeMessage() async {
  //   print("notifacation manager called");
  //   RemoteMessage? message =
  //       await FirebaseMessaging.instance.getInitialMessage();
  //   if (message != null) {
  //     if (message.data["page"] == "page") {
  //       // notificationList.add(notificationdata);
  //       // preferences.s
  //       currentIndex = 3;
  //       notifyListeners();
  //     } else if (message.data["page"] == "home") {
  //       currentIndex = 0;
  //       notifyListeners();
  //     } else {
  //       print("Invalid page");
  //     }
  //   }
  // }
  // noti(NOTIFICATIONDATA notificationdata) {
  //   final notJson = json.encode(notificationdata.toJson());
  //   notificationList.add(notJson);
  //   setnotifications(notificationList);
  //   // log(message.notification!.title.toString());
  // }

  // setnotifications(List<String> notificationdata) async {
  //   final preferences = await SharedPreferences.getInstance();

  //   await preferences.setStringList(key, notificationList);
  //   notifyListeners();
  // }

  // getnotifications() async {
  //   final preferences = await SharedPreferences.getInstance();

  //   notificationList = preferences.getStringList(key)!;
  //   notifyListeners();
  // }

  // getObjects() {
  //   getnotifications();
  //   notificationObjectList = List.generate(notificationList.length, (index) {
  //     NOTIFICATIONDATA notificationdata =
  //         NOTIFICATIONDATA.fromJson(json.decode(notificationList[index]));
  //     return notificationdata;
  //   });
  //   notifyListeners();
  //   print(notificationObjectList[0].body);
  // }
  // final notJson = preferences.getString("notificationdata");
  // if (notJson == null) return;
  // final notificationdata = NOTIFICATIONDATA.fromMap(notJson);

}

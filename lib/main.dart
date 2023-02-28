import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import 'Features/application/application_manager.dart';
import 'Features/auth/auth_manager.dart';
import 'Features/chat/chat_manager.dart';
import 'Features/newsfeed/news_manager.dart';
import 'Features/notification/notification_manager.dart';
import 'Features/services/services_manager.dart';
import 'Shared/apptheme.dart';

void main() async {
  FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
  await Firebase.initializeApp();
  FirebaseFirestore.instance.settings =
      const Settings(persistenceEnabled: true);
  await NotifcationManager.initialize();

  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<AuthManager>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthManager>(create: (context) => AuthManager()),
        ChangeNotifierProvider<NewsManager>(create: (context) => NewsManager()),
        ChangeNotifierProvider<ServicesManager>(
            create: (context) => ServicesManager()),
        ChangeNotifierProvider<ApplicationManager>(
            create: (context) => ApplicationManager()),
        ChangeNotifierProvider<NotifcationManager>(
            create: (context) => NotifcationManager()),
        ChangeNotifierProvider<ChatManager>(create: (context) => ChatManager()),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: 'Ezapply',
        theme: AppTheme.lightTheme,
        home: AuthManager.isLogined(),
        // home: Signuppage(),
      ),
    );
  }
}

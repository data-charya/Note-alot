import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Notealot/pages/landing.dart';
import 'pages/landing.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/Home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  User firebaseuser = FirebaseAuth.instance.currentUser;
  Widget firstWidget;

  @override
  Widget build(BuildContext context) {
    if (firebaseuser != null) {
      firstWidget = Home();
    } else {
      firstWidget = Landing();
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: firstWidget,
    );
  }
}

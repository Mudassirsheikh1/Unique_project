import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:unique_project/auth/main_page.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAhlSvD278E5c_wvjL0yBjwYm0tTXHnGus",
          appId:"1:329538676104:android:5dddc8d9e029c50df6063d",
          messagingSenderId: "329538676104",
          projectId:"unique-8a712",
      )
  );
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: MainPage(),
    );
  }
}
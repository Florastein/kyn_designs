import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kyn_designs/home.dart';
import 'package:kyn_designs/login_page.dart';
import 'package:kyn_designs/service_page.dart';
import 'package:kyn_designs/sign_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyDOhQpW6RrlrQ-Sq2RcYz6dCdDpat8vTu0",
        projectId: "kyn-designs",
        storageBucket: "kyn-designs.appspot.com",
        messagingSenderId: "166043935365",
        appId: "1:166043935365:web:66e661715eaf6296ed7fec",
        measurementId: "G-DCMCEJ2N3Y"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kyn Designs & Tech',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: SignUp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

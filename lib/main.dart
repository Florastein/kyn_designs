import 'package:flutter/material.dart';
import 'package:kyn_designs/home.dart';
import 'package:kyn_designs/login_page.dart';
import 'package:kyn_designs/sign_up.dart';

void main() {
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
      home: const SignUp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

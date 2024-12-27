import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kyn_designs/home.dart';
import 'package:kyn_designs/login_page.dart';
import 'package:kyn_designs/pages/dashboard.dart';
import 'package:kyn_designs/service/auth_page.dart';
import 'package:kyn_designs/service_page.dart';
import 'package:kyn_designs/sign_up.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDOhQpW6RrlrQ-Sq2RcYz6dCdDpat8vTu0",
        projectId: "kyn-designs",
        storageBucket: "kyn-designs.appspot.com",
        messagingSenderId: "166043935365",
        appId: "1:166043935365:web:66e661715eaf6296ed7fec",
        measurementId: "G-DCMCEJ2N3Y"),
  );

  await Supabase.initialize(
    url: 'https://abynugglbsgzemvnoahq.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFieW51Z2dsYnNnemVtdm5vYWhxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE2NDk0MzYsImV4cCI6MjA0NzIyNTQzNn0.RfIp59GLP4SSQ2C0BiL3p1Hl-JlEeSa2ZNqHDeMZJUY',
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
      home: ServicePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

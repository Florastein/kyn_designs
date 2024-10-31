import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kyn_designs/custom/logs_navbar.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void SignOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [Navbar()],
    ));
  }
}

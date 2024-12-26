import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kyn_designs/home.dart';
import 'package:kyn_designs/pages/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  Future<String?> getUserRole(String uid) async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    if (snapshot.exists) {
      return snapshot['role'];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data;

            if (user == null) {
              return HomePage();
            }

            return FutureBuilder<String?>(
              future: getUserRole(user.uid),
              builder: (context, roleSnapshot) {
                if (roleSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (roleSnapshot.hasData) {
                  final role = roleSnapshot.data;
                  if (role == 'admin') {
                    print("Admin logged in");
                    return Dashboard(); 
                  } else if (role == 'customer') {
                    print("Customer logged in");
                    return Dashboard();
                  }
                }

                return Center(child: Text("Unable to determine role"));
              },
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

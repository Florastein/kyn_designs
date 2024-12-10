import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kyn_designs/home.dart';
import 'package:kyn_designs/pages/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Needed for Firestore

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  // Function to retrieve user role from Firestore
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
          // Check if the user is logged in
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data;

            // If the user is logged out
            if (user == null) {
              return HomePage(); // Replace this with your sign-in page or home page
            }

            // If the user is logged in, check their role
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
                    // Navigate to Admin dashboard
                    return Dashboard(); // Adjust this to navigate to the Admin dashboard
                  } else if (role == 'customer') {
                    print("Customer logged in");
                    // Navigate to Customer dashboard
                    return Dashboard(); // Adjust this to navigate to the Customer dashboard
                  }
                }

                // If there's an issue getting the role or role is unknown
                return Center(child: Text("Unable to determine role"));
              },
            );
          }

          // Show loading indicator while the connection is active
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

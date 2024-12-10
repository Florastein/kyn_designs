/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseMethods {
  /*Future newRegistration(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("User")
        .doc(id)
        .set(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getUserDetails() async {
    return await FirebaseFirestore.instance.collection("User").snapshots();
  }

  Future logInDetails(Map<String, dynamic> userLoginMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Credentals")
        .doc(id)
        .set(userLoginMap);
  }*/

  Future newRegistration(Map<String, dynamic> userInfoMap, String id) async {
    try {
      await FirebaseFirestore.instance
          .collection("User")
          .doc(id)
          .set(userInfoMap);
    } catch (e) {
      print("Error registering new user: $e");
      // Consider handling the error or re-throwing it as needed
    }
  }

  Stream<QuerySnapshot> getUserDetails() {
    return FirebaseFirestore.instance.collection("User").snapshots();
  }

  
}*/

/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future newRegistration(
      Map<String, dynamic> userInfoMap, String email, String password) async {
    // Create user with email and password
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // If successful, add user info to Firestore
    await FirebaseFirestore.instance
        .collection("User")
        .doc(credential.user?.uid) // Use FirebaseAuth UID as the document ID
        .set(userInfoMap);
  }

  Stream<QuerySnapshot> getUserDetails() {
    return FirebaseFirestore.instance.collection("User").snapshots();
  }
}
*/

/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kyn_designs/pages/dashboard.dart';

class DatabaseMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? currentUsername; // Stores the username of the logged-in user

  Future<void> newRegistration(
      Map<String, dynamic> userInfoMap, String email, String password) async {
    // Create user with email and password
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // If successful, add user info to Firestore
    await FirebaseFirestore.instance
        .collection("User")
        .doc(credential.user?.uid) // Use FirebaseAuth UID as the document ID
        .set(userInfoMap);
  }

  Stream<QuerySnapshot> getUserDetails() {
    return FirebaseFirestore.instance.collection("User").snapshots();
  }

  // Sign-in method to integrate with Firebase Auth and retrieve username
  Future<void> signUserIn(
      BuildContext context,
      TextEditingController emailController,
      TextEditingController passwordController) async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.orange,
              strokeWidth: 10,
            ),
          );
        });

    try {
      // Attempt to sign in
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      // Retrieve username from Firestore
      String uid = userCredential.user?.uid ?? '';
      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection("User").doc(uid).get();

      // Store the username
      currentUsername =
          userDoc['Username']; // Assuming "username" is the field name

      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = "User Not Found";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Wrong Username or Password";
      } else {
        errorMessage = e.code;
      }
      _showPopup(context, errorMessage);
    }
  }

  // Popup for error messages
  void _showPopup(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            content: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.error,
                  color: Colors.white,
                  size: 48,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    message,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ],
            ),
          );
        });
  }

  // Getter to access current username from other classes
  String? get getCurrentUsername => currentUsername;

  Future<String?> fetchUsernameByEmail(String email) async {
    try {
      // Query Firestore for a user document where the Email field matches
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection("User")
          .where("Email", isEqualTo: email)
          .get();

      if (snapshot.docs.isNotEmpty) {
        // Get the "Fullname" field from the first matching document
        return snapshot.docs.first.get("Fullname") as String?;
      } else {
        return "User not found";
      }
    } catch (e) {
      // Handle any errors here
      return "Error retrieving username";
    }
  }
}*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kyn_designs/pages/dashboard.dart';

class DatabaseMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> newRegistration(
      Map<String, dynamic> userInfoMap, String email, String password) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    String uid = credential.user!.uid;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .set(userInfoMap);
  }

  Stream<QuerySnapshot> getUserDetails() {
    return FirebaseFirestore.instance.collection("users").snapshots();
  }

  Future<void> signUserIn(
      BuildContext context,
      TextEditingController emailController,
      TextEditingController passwordController) async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.orange,
              strokeWidth: 10,
            ),
          );
        });

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = "User Not Found";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Wrong Username or Password";
      } else {
        errorMessage = e.code;
      }
      _showPopup(context, errorMessage);
    }
  }

  // Popup for error messages
  void _showPopup(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            content: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.error,
                  color: Colors.white,
                  size: 48,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    message,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future<String?> getUserName(String uid) async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
  }

  Future<String?> getUserRole(String uid) async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if (snapshot.exists) {
      return snapshot['role']; // Returns the role
    }
    return null;
  }
}

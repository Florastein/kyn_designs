import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kyn_designs/service/database.dart';

class UserActionsWidget extends StatefulWidget {
  final VoidCallback onEditAccount;
  final VoidCallback onLogout;

  UserActionsWidget({
    Key? key,
    required this.onEditAccount,
    required this.onLogout,
  }) : super(key: key);

  @override
  State<UserActionsWidget> createState() => _UserActionsWidgetState();
}

class _UserActionsWidgetState extends State<UserActionsWidget> {
  final DatabaseMethods databaseMethods = DatabaseMethods();
  String? username;

  @override
  void initState() {
    super.initState();
    fetchUsername();
  }

  Future<void> fetchUsername() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    String? fetchedUsername = await databaseMethods.getUserName(uid);
    setState(() {
      username = fetchedUsername;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      elevation: 8,
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 8,
                  offset: Offset(0, 3))
            ]),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.account_circle_rounded,
              size: 38,
              color: Colors.white,
            ),
            SizedBox(
              width: 15,
            ),
            username != null ? Text('$username') : CircularProgressIndicator(),
            Icon(
              CupertinoIcons.arrowtriangle_down_fill,
              color: Colors.white,
              size: 18,
            )
          ],
        ),
      ),
      onSelected: (value) {
        if (value == 1) {
          widget.onEditAccount();
        } else if (value == 2) {
          widget.onLogout();
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Row(
            children: [
              Icon(CupertinoIcons.pencil, color: Colors.blue),
              SizedBox(width: 10),
              Text("Edit Account"),
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Row(
            children: [
              Icon(CupertinoIcons.arrow_right_square, color: Colors.red),
              SizedBox(width: 10),
              Text("Log Out"),
            ],
          ),
        ),
      ],
    );
  }
}

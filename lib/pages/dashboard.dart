import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      sideBar: SideBar(
        backgroundColor: Colors.white,
        activeBackgroundColor: Colors.orange,
        textStyle: GoogleFonts.montserrat(fontSize: 18),
        items: [
          AdminMenuItem(
              title: "Home",
              icon: CupertinoIcons.home,
              route: '/DashboardContent'),
          AdminMenuItem(title: "Orders", icon: CupertinoIcons.printer),
          AdminMenuItem(title: "Files", icon: CupertinoIcons.doc_fill),
          AdminMenuItem(
              title: "Templates", icon: CupertinoIcons.layers_alt_fill),
          AdminMenuItem(title: "Settings", icon: Icons.settings)
        ],
        selectedRoute: '/',
        footer: Column(
          children: [
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.person_2),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Profile")
                  ],
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Log Out")
                  ],
                ),
              ),
            )
          ],
        ),
        header: SizedBox(
          height: MediaQuery.of(context).size.height * 0.10,
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
        ),
      ),
    );
  }
}

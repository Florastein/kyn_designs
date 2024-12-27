import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kyn_designs/dashboard_pages/dashboard_content.dart';
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
        items: const [
          AdminMenuItem(
              title: "Home",
              icon: CupertinoIcons.home,
              route: 'DashboardContent'),
          AdminMenuItem(
              title: "Orders", icon: CupertinoIcons.printer, route: ''),
          AdminMenuItem(title: "Files", icon: CupertinoIcons.doc_fill),
          AdminMenuItem(
              title: "Templates", icon: CupertinoIcons.layers_alt_fill),
          AdminMenuItem(title: "Settings", icon: Icons.settings)
        ],
        selectedRoute: '', // Set the selected route to an empty string
        onSelected: (item) {
          // Handle sidebar item selection
          final index = [
            'Home',
            'Orders',
            'Files',
            'Templates',
            'Settings',
          ].indexOf(item.title);
          if (index != -1) {
            _onMenuItemSelected(index);
          }
        },
        footer: Column(
          children: [
            GestureDetector(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(16),
                child: const Row(
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
                decoration: const BoxDecoration(color: Colors.white),
                padding: const EdgeInsets.all(16),
                child: const Row(
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
            decoration: const BoxDecoration(color: Colors.white),
          ),
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}

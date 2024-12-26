import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kyn_designs/custom/logs_navbar.dart';
import 'package:kyn_designs/dashboard_pages/history.dart';
import 'package:kyn_designs/dashboard_pages/new_order.dart';
import 'package:kyn_designs/dashboard_pages/order_status.dart';
import 'package:kyn_designs/dashboard_pages/report.dart';
import 'package:kyn_designs/dashboard_pages/settings.dart';
import 'package:kyn_designs/login_page.dart';

// class Dashboard extends StatelessWidget {
//   Dashboard({super.key});

//   final user = FirebaseAuth.instance.currentUser;

//   void SignOut() {
//     FirebaseAuth.instance.signOut();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     if (user == null) {
//       return Scaffold(
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => LoginPage()),
//               );
//             },
//             child: Text('Please log in'),
//           ),
//         ),
//       );
//     }

//     const mobileBreakpoint = 480.0;
//     const tabletBreakpoint = 768.0;

//     if (screenWidth >= tabletBreakpoint) {
//       return Scaffold(
//         backgroundColor: Colors.grey[300],
//         body: Column(
//           children: [
//             const Navbars(),
//             Stack(
//               children: [
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Sidebar(),
//                 ),
//               ],
//             )
//           ],
//         ),
//       );
//     } else {
//       return Scaffold(
//         body: Column(
//           children: [
//             Navbars(),
//             Stack(
//               children: [
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: BottomNavBar(),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       );
//     }
//   }
// }

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    Dashboard(),
    OrderStatus(),
    NewOrder(),
    History(),
    Report(),
    Settings(),
  ];

  void _onMenuItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      sideBar: SideBar(
        textStyle: GoogleFonts.poppins(
            letterSpacing: 1.5, wordSpacing: 2, fontSize: 18),
        activeTextStyle: GoogleFonts.lexend(
            fontSize: 20,
            letterSpacing: 1.5,
            wordSpacing: 2,
            fontWeight: FontWeight.w600),
        items: const [
          AdminMenuItem(
              title: 'Dashboard', route: '/', icon: Icons.home_filled),
          AdminMenuItem(
            title: 'Order Status',
            icon: Icons.dashboard,
          ),
          AdminMenuItem(
            title: 'New Order',
            icon: Icons.dashboard,
          ),
          AdminMenuItem(
            title: 'History',
            icon: Icons.dashboard,
          ),
          AdminMenuItem(
            title: 'Report an Issue',
            icon: Icons.dashboard,
          ),
          AdminMenuItem(
            title: 'Settings',
            icon: Icons.dashboard,
          ),
        ],
        selectedRoute: '', // No route navigation here
        onSelected: (item) {
          // Update selected page based on the item's index
          final index = [
            'Dashboard',
            'Order Status',
            'New Order',
            'History',
            'Report an Issue',
            'Settings',
          ].indexOf(item.title);
          if (index != -1) {
            _onMenuItemSelected(index);
          }
        },
        header: Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset("assets/images/logo.png"),
            )),
      ),
      body: _pages[_selectedIndex],
    );
  }
}

class ResponsiveSidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (MediaQuery.of(context).size.width > 600) {
            // Use a Sidebar for larger screens
            return Row(
              children: [
                Sidebar(),
                Expanded(
                  child: ContentArea(),
                ),
              ],
            );
          } else {
            // Use a Bottom Navigation Bar for smaller screens
            return Scaffold(
              body: ContentArea(),
              bottomNavigationBar: BottomNavBar(),
            );
          }
        },
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(color: Colors.white.withOpacity(0.4), offset: Offset(3, 0)),
        ],
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          SizedBox(height: 20),
          SidebarItem(
            icon: Icons.home,
            label: "Home",
          ),
          SidebarItem(icon: Icons.person, label: "Profile"),
          SidebarItem(icon: Icons.settings, label: "Settings"),
          SidebarItem(icon: Icons.info, label: "About"),
        ],
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const SidebarItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.black),
          SizedBox(width: 16),
          Text(
            label,
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
      ],
    );
  }
}

class ContentArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Center(
        child: Text(
          'Content Area',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

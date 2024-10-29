import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kyn_designs/about_us.dart';
import 'package:kyn_designs/contact_page.dart';
import 'package:kyn_designs/custom/custom_button.dart';
import 'package:kyn_designs/home.dart';
import 'package:kyn_designs/login_page.dart';
import 'package:kyn_designs/service_page.dart';
import 'package:kyn_designs/sign_up.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final List<bool> _isHovered = List.generate(4, (_) => false);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildLogo(),
            _buildMenu(),
            _buildActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Row(
      children: [
        Image.asset('images/logo.png', height: 90, width: 90),
        Text(
          "KYN DESIGNS & TECH",
          style: GoogleFonts.poppins(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildMenu() {
    const menuItems = ['Home', 'Services', 'About Us', 'Contact'];
    return Row(
      children: List.generate(menuItems.length, (index) {
        return _buildMenuItem(index, menuItems[index]);
      }),
    );
  }

  Widget _buildMenuItem(int index, String title) {
    return MouseRegion(
      onEnter: (_) => _onHover(index, true),
      onExit: (_) => _onHover(index, false),
      child: TextButton(
        onPressed: () => _navigateToPage(index),
        child: Text(
          title,
          style: TextStyle(
            color: _isHovered[index] ? Colors.orange : Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildActions() {
    return Row(
      children: [
        CustomButton(
          text: "LOG IN",
          color: Colors.orange,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            );
          }, // Add your login logic here
          textColor: Colors.white,
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignUp(),
              ),
            );
          }, // Add your account creation logic here
          child: Text(
            'Create Account',
            style: GoogleFonts.poppins(color: Colors.black, fontSize: 16),
          ),
        ),
      ],
    );
  }

  void _onHover(int index, bool isHovered) {
    setState(() {
      _isHovered[index] = isHovered;
    });
  }

  void _navigateToPage(int index) {
    switch (index) {
      case 0: // Home
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        break;
      case 1: // Services
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ServicePage()),
        );
        break;
      case 2: // About Us
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AboutUsPage()),
        );
        break;
      case 3: // Contact
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ContactPage()),
        );
        break;
    }
  }
}

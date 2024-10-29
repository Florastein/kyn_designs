import 'package:flutter/material.dart';
import 'package:kyn_designs/custom/navbar.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Navbar(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

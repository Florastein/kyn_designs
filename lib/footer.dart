import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Row(
          children: [
            Text(
              "Suscribe To Our Newsletter",
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
            )
          ],
        )
      ],
    ));
  }
}

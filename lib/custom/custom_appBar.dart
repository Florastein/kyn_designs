import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kyn_designs/custom/customText.dart';

class CustomAppbar extends StatefulWidget {
  const CustomAppbar({super.key});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Image.asset(
              'images/logo.png',
              width: 90,
              height: 90,
            ),
            Text(
              "Kyn Designs & Tech",
              style: GoogleFonts.poppins(
                  fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HoverUnderlineText(text: "HOME", onTap: () {}, size: 24),
            HoverUnderlineText(text: "SERVICES", onTap: () {}, size: 24)
          ],
        )
      ],
    );
  }
}

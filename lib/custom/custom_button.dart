import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;

  const CustomButton(
      {Key? key,
      required this.text,
      required this.color,
      required this.onPressed,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
        child: Text(
          text,
          style: GoogleFonts.poppins(
              color: textColor, fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

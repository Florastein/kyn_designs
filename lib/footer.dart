import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  final _emailController = TextEditingController();
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: Colors.orange),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 40 / 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "Suscribe To Our Newsletter",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 16),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.bubble_left_fill),
                        prefixIconColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 30.0,
                            color: Colors.white,
                          ),
                        ),
                        label: Text(
                          "Email",
                          style: GoogleFonts.acme(),
                        ),
                        errorText: _errorMessage,
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _errorMessage = validateEmail(_emailController.text);
                      });
                    },
                    child: Text('Subscribe'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? validateEmail(String email) {
    if (email.isEmpty) return "Please enter your email";
    final emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.[a-zA-Z]{2,}$");
    if (!emailRegExp.hasMatch(email)) {
      return 'Invalid email format';
    }
    return null; // No error
  }
}

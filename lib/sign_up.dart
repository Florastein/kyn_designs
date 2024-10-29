/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kyn_designs/custom/custom_text_box.dart';
import 'package:kyn_designs/custom/navbar.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Navbar(), Center(child: Logger())],
      ),
    ));
    ;
  }
}

class Logger extends StatelessWidget {
  const Logger({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Image.asset(
              'images/logo.png',
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.25,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "REGISTER",
            style: GoogleFonts.montserrat(
                fontSize: 48, fontWeight: FontWeight.w600),
          ),
          CustomTextBox(hintText: "Username", icon: CupertinoIcons.person_alt),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextBox(
                  hintText: "Location", icon: CupertinoIcons.location_fill),
              CustomTextBox(
                  hintText: "Phone Number", icon: CupertinoIcons.phone_solid)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't Have An Account?",
                style: GoogleFonts.poppins(),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Register Now",
                    style: GoogleFonts.poppins(
                        color: Colors.orange, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: MediaQuery.of(context).size.width * 10 / 100,
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Log In With Phone",
                        style: GoogleFonts.poppins(color: Colors.white),
                      )
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}

class LabelText extends StatelessWidget {
  final String text;
  const LabelText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Text(
          text,
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, color: Colors.grey[600]),
        ),
      ),
    );
  }
}
*/

/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kyn_designs/custom/custom_text_box.dart';
import 'package:kyn_designs/custom/navbar.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8, // Constrain width
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Navbar(),
              const SizedBox(height: 20),
              const Logo(),
              const SizedBox(height: 20),
              const Text(
                "REGISTER",
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.w600),
              ),
              CustomTextBox(
                  hintText: "Username", icon: CupertinoIcons.person_alt),
              const SizedBox(height: 10), // Space between fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: CustomTextBox(
                          hintText: "Location",
                          icon: CupertinoIcons.location_fill)),
                  const SizedBox(width: 10), // Space between fields
                  Expanded(
                      child: CustomTextBox(
                          hintText: "Phone Number",
                          icon: CupertinoIcons.phone_solid)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't Have An Account?",
                    style: GoogleFonts.poppins(),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Register Now",
                      style: GoogleFonts.poppins(
                          color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: MediaQuery.of(context).size.width *
                        0.4, // Adjusted width
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.phone, color: Colors.white),
                        const SizedBox(width: 8),
                        Text(
                          "Log In With Phone",
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'images/logo.png',
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height * 0.25,
      ),
    );
  }
}

class LabelText extends StatelessWidget {
  final String text;
  const LabelText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Text(
          text,
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, color: Colors.grey[600]),
        ),
      ),
    );
  }
}
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kyn_designs/custom/custom_text_box.dart';
import 'package:kyn_designs/custom/navbar.dart';
import 'package:kyn_designs/login_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Navbar(),
            Expanded(
                child: Center(child: Logger())), // Use Expanded to fill space
          ],
        ),
      ),
    );
  }
}

class Logger extends StatefulWidget {
  const Logger({super.key});

  @override
  State<Logger> createState() => _LoggerState();
}

class _LoggerState extends State<Logger> {
  String _password = '';
  String _confirmPassword = '';
  String _errorMessage = '';

  void _validatePassword() {
    setState(() {
      if (_password != _confirmPassword) {
        _errorMessage = 'Passwords do not match';
      } else {
        _errorMessage = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25, // Constrain width
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Image.asset(
              'images/logo.png',
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.25,
            ),
          ),
          Text(
            "REGISTER",
            style: GoogleFonts.montserrat(
                fontSize: 32, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10), // Add space between fields
          CustomTextBox(hintText: "Username", icon: CupertinoIcons.person_alt),
          const SizedBox(height: 10), // Space between fields
          CustomTextBox(
              hintText: "Full Name", icon: CupertinoIcons.person_2_fill),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomTextBox(
                    hintText: "Location", icon: CupertinoIcons.location_fill),
              ),
              const SizedBox(width: 10), // Space between fields
              Expanded(
                child: CustomTextBox(
                    hintText: "Phone Number", icon: CupertinoIcons.phone_solid),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomTextBox(
                  isPassword: true,
                  hintText: "Password",
                  icon: CupertinoIcons.lock_shield_fill,
                  onChanged: (value) {
                    _password = value;
                    _validatePassword();
                  },
                ),
              ),
              const SizedBox(width: 10), // Space between fields
              Expanded(
                child: CustomTextBox(
                  isPassword: true,
                  hintText: "Confirm Password",
                  icon: CupertinoIcons.lock_shield_fill,
                  onChanged: (value) {
                    _confirmPassword = value;
                    _validatePassword();
                  },
                ),
              ),
            ],
          ),
          if (_errorMessage.isNotEmpty) // Show error message if needed
            Text(
              _errorMessage,
              style: TextStyle(color: Colors.red),
            ),

          const SizedBox(height: 20),

          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: MediaQuery.of(context).size.width * 0.1, // Adjust width
                child: Center(
                  child: Text(
                    "Create Account",
                    style: GoogleFonts.montserrat(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already Have An Account?",
                style: GoogleFonts.poppins(),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                child: Text(
                  "Log In Here",
                  style: GoogleFonts.ubuntuCondensed(
                      color: Colors.orange, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LabelText extends StatelessWidget {
  final String text;
  const LabelText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
        ),
      ),
    );
  }
}

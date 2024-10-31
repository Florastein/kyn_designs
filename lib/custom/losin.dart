import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kyn_designs/custom/custom_text_box.dart';
import 'package:kyn_designs/login_page.dart';
import 'package:kyn_designs/service/database.dart';
import 'package:random_string/random_string.dart';

class Logger extends StatefulWidget {
  const Logger({super.key});

  @override
  State<Logger> createState() => _LoggerState();
}

class _LoggerState extends State<Logger> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  String _password = '';
  String _errorMessage = '';

  void _validatePassword() {
    setState(() {
      if (_passwordController.text != _confirmpasswordController.text) {
        _errorMessage = 'Passwords do not match';
      } else {
        _errorMessage = '';
        _password = _passwordController.text;
      }
    });
  }

  void _registerUser() async {
    _validatePassword();
    if (_errorMessage.isNotEmpty) {
      Fluttertoast.showToast(
        msg: _errorMessage,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
      return;
    }

    String id = randomAlphaNumeric(10);
    Map<String, dynamic> userInfoMap = {
      "Id": id,
      "Username": _userNameController.text,
      "Email": _emailController.text,
      "Fullname": _fullNameController.text,
      "Location": _locationController.text,
      "Phone Number": _phoneNumberController.text.trim(),
      "Password": _password,
    };

    await DatabaseMethods().newRegistration(userInfoMap, id).then((value) {
      Fluttertoast.showToast(
        msg: "Registration Successful",
        backgroundColor: Colors.green,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }).catchError((error) {
      Fluttertoast.showToast(
        msg: "Registration Failed: $error",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
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
          const SizedBox(height: 10),
          CustomTextBox(
            controller: _userNameController,
            hintText: "Username",
            icon: CupertinoIcons.person_alt,
          ),
          SizedBox(height: 10),
          CustomTextBox(
            controller: _emailController,
            hintText: "Email",
            icon: Icons.email,
          ),
          const SizedBox(height: 10),
          CustomTextBox(
            controller: _fullNameController,
            hintText: "Full Name",
            icon: CupertinoIcons.person_2_fill,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomTextBox(
                  controller: _locationController,
                  hintText: "Location",
                  icon: CupertinoIcons.location_fill,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: CustomTextBox(
                  controller: _phoneNumberController,
                  hintText: "Phone Number",
                  icon: CupertinoIcons.phone_solid,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomTextBox(
                  controller: _passwordController,
                  isPassword: true,
                  hintText: "Password",
                  icon: CupertinoIcons.lock_shield_fill,
                  onChanged: (value) => _validatePassword(),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomTextBox(
                  controller: _confirmpasswordController,
                  isPassword: true,
                  hintText: "Confirm Password",
                  icon: CupertinoIcons.lock_shield_fill,
                  onChanged: (value) => _validatePassword(),
                ),
              ),
            ],
          ),
          if (_errorMessage.isNotEmpty)
            Text(
              _errorMessage,
              style: TextStyle(color: Colors.red),
            ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: _registerUser,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              width: MediaQuery.of(context).size.width * 0.1,
              child: Center(
                child: Text(
                  "Create Account",
                  style: GoogleFonts.montserrat(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already Have An Account?", style: GoogleFonts.poppins()),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text(
                  "Log In Here",
                  style: GoogleFonts.montserrat(
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

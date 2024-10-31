import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_popup_card/flutter_popup_card.dart';
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

  void _clearForm() {
    _userNameController.clear();
    _emailController.clear();
    _fullNameController.clear();
    _locationController.clear();
    _phoneNumberController.clear();
    _passwordController.clear();
    _confirmpasswordController.clear();

    setState(() {
      _errorMessage = '';
      _password = '';
    });
  }

  void _registerUser() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.orange,
              strokeWidth: 10,
            ),
          );
        });

    _validatePassword();
    if (_errorMessage.isNotEmpty) {
      Navigator.pop(context);
      SnackBar(
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
        content: Row(
          children: [
            Icon(
              Icons.dangerous,
              color: Colors.white,
              size: 32,
            ),
            Text(
              _errorMessage,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ],
        ),
      );
      return;
    }

    String id = randomAlphaNumeric(10);
    Map<String, dynamic> userInfoMap = {
      "Username": _userNameController.text,
      "Email": _emailController.text,
      "Fullname": _fullNameController.text,
      "Location": _locationController.text,
      "Phone Number": _phoneNumberController.text.trim(),
      "Password": _password,
    };

    await DatabaseMethods()
        .newRegistration(userInfoMap, _emailController.text, _password)
        .then((value) {
      /*Fluttertoast.showToast(
        msg: "Registration Successful",
        backgroundColor: Colors.green,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
      );*/
      _clearForm();
      showPopupCard(
          context: context,
          builder: (context) {
            return PopupCard(
              elevation: 8,
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.hand_thumbsup,
                            size: 24,
                            color: Colors.white,
                          ),
                          Text(
                            "Registraion Successful",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  )),
            );
          });
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
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
  void dispose() {
    super.dispose();
    _userNameController.dispose();
    _emailController.dispose();
    _fullNameController.dispose();
    _locationController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
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

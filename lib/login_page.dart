import 'package:flutter/material.dart';
import 'package:kyn_designs/custom/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [Navbar(), Fored()],
    ));
  }
}

/*Stack(
        children: [
          // Background or any other widgets can go here
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: const Navbar(),
          ),
          Positioned(
            top: 80, // Adjust based on the height of your Navbar
            left: 0,
            right: 0,
            child: Fored(),
          ),
        ],
      )*/

/*class Fored extends StatefulWidget {
  const Fored({super.key});

  @override
  State<Fored> createState() => _ForedState();
}

class _ForedState extends State<Fored> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _errorMessage = '';

  Future<void> _login() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Navigate to home page or wherever you want
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              errorText: _errorMessage.isNotEmpty ? '$_errorMessage' : null,
            ),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              errorText: _errorMessage.isNotEmpty ? '$_errorMessage' : null,
            ),
            obscureText: true,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _login,
            child: Text('Login'),
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {
              // Navigate to sign up page or reset password
            },
            child: Text('Don\'t have an account? Sign Up'),
          ),
        ],
      ),
    );
  }
}
*/

class Fored extends StatefulWidget {
  const Fored({super.key});

  @override
  _ForedState createState() => _ForedState();
}

class _ForedState extends State<Fored> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  String _verificationId = '';
  bool _codeSent = false;
  String _errorMessage = '';

  Future<void> _verifyPhoneNumber() async {
    final PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential credential) async {
      await _auth.signInWithCredential(credential);
      // Navigate to the next page after successful login
      Navigator.pushReplacementNamed(
          context, '/home'); // Change '/home' to your target route
    };

    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException e) {
      setState(() {
        _errorMessage = e.message ?? 'Verification failed';
      });
    };

    final PhoneCodeSent codeSent = (String verificationId, int? resendToken) {
      setState(() {
        _verificationId = verificationId;
        _codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      setState(() {
        _verificationId = verificationId;
      });
    };

    await _auth.verifyPhoneNumber(
      phoneNumber: _phoneController.text.trim(),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  Future<void> _signInWithOTP(String smsCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: smsCode);
      await _auth.signInWithCredential(credential);
      // Navigate to the next page after successful login
      Navigator.pushReplacementNamed(
          context, '/home'); // Change '/home' to your target route
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _phoneController,
            decoration: InputDecoration(
              labelText: 'Phone Number (+1234567890)',
              errorText: _errorMessage.isNotEmpty ? _errorMessage : null,
            ),
          ),
          if (_codeSent) ...[
            TextField(
              controller: _otpController,
              decoration: const InputDecoration(
                labelText: 'OTP',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _signInWithOTP(_otpController.text.trim()),
              child: const Text('Verify OTP'),
            ),
          ] else ...[
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _verifyPhoneNumber,
              child: const Text('Send OTP'),
            ),
          ],
        ],
      ),
    );
  }
}

/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kyn_designs/custom/navbar.dart';
import 'package:kyn_designs/sign_up.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Navbar(), Center(child: Logger())],
      ),
    ));
  }
}*/

/*class Fored extends StatefulWidget {
  const Fored({super.key});

  @override
  _ForedState createState() => _ForedState();
}

class _ForedState extends State<Fored> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  String _verificationId = '';
  bool _codeSent = false;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _phoneController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  Future<void> _verifyPhoneNumber() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: _phoneController.text.trim(),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          _navigateToHome();
        },
        verificationFailed: (_) {
          setState(() {
            _errorMessage = 'Phone number verification failed';
            _isLoading = false;
          });
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            _verificationId = verificationId;
            _codeSent = true;
            _isLoading = false;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        },
      );
    } catch (e) {
      setState(() {
        _errorMessage = 'An error occurred. Please try again later.';
        _isLoading = false;
      });
    }
  }

  Future<void> _signInWithOTP() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: _otpController.text.trim(),
      );

      await _auth.signInWithCredential(credential);
      _navigateToHome();
    } catch (e) {
      setState(() {
        _errorMessage = 'Invalid OTP or an unexpected error occurred.';
        _isLoading = false;
      });
    }
  }

  void _navigateToHome() {
    Navigator.pushReplacementNamed(
        context, '/home'); // Change '/home' to your target route
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _phoneController,
            decoration: InputDecoration(
              labelText: 'Phone Number (+1234567890)',
              errorText: _errorMessage,
            ),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 20),
          if (_codeSent)
            TextField(
              controller: _otpController,
              decoration: const InputDecoration(
                labelText: 'OTP',
              ),
              keyboardType: TextInputType.number,
            ),
          const SizedBox(height: 20),
          _isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: _codeSent ? _signInWithOTP : _verifyPhoneNumber,
                  child: Text(_codeSent ? 'Verify OTP' : 'Send OTP'),
                ),
        ],
      ),
    );
  }
}*/


/*class Logger extends StatelessWidget {
  const Logger({super.key});

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
            "LOG IN",
            style: GoogleFonts.montserrat(
                fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Email",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Email TextField with Rounded Style
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              filled: true,
              prefixIcon: const Icon(CupertinoIcons.mail),
              fillColor: Colors.grey[100],
              hintText: 'Enter your email',
              hintStyle: TextStyle(color: Colors.grey[500]),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Password Label
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Password",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Password TextField with Rounded Style
          TextField(
            obscureText: true,
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                filled: true,
                fillColor: Colors.grey[100],
                hintText: 'Enter your password',
                hintStyle: TextStyle(color: Colors.grey[500]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.password_rounded)),
          ),
          const SizedBox(height: 30),
          // Login Button with Gradient
          SizedBox(
            width: MediaQuery.of(context).size.width * 20 / 100,
            child: ElevatedButton(
              onPressed: () {
                // Handle login action
              },
              style: ElevatedButton.styleFrom(
                elevation: 4,
                padding: const EdgeInsets.symmetric(vertical: 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: Colors.red,
              ),
              child: Text(
                'LOG IN',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't Have An Account?",
                style: GoogleFonts.poppins(),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUp(),
                      ),
                    );
                  },
                  child: Text(
                    "Register Now",
                    style: GoogleFonts.poppins(
                        color: Colors.orange, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
          const SizedBox(
            height: 25,
          ),
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
                  width: MediaQuery.of(context).size.width * 10 / 100,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      const SizedBox(
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
}*/

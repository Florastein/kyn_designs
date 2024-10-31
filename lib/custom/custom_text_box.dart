import 'package:flutter/material.dart';

/*class CustomTextBox extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final IconData icon;

  const CustomTextBox(
      {super.key,
      required this.hintText,
      this.isPassword = false,
      required this.icon});

  @override
  _CustomTextBoxState createState() => _CustomTextBoxState();
}

class _CustomTextBoxState extends State<CustomTextBox> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isPassword ? _obscureText : false,
      keyboardType: widget.isPassword
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        filled: true,
        prefixIcon: Icon(
          widget.icon,
          color: Colors.grey[500],
        ),
        fillColor: Colors.grey[100],
        labelText: widget.hintText,
        labelStyle: TextStyle(color: Colors.orange[500]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: _togglePasswordVisibility,
              )
            : null,
      ),
    );
  }
}*/

class CustomTextBox extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final IconData icon;
  final ValueChanged<String>? onChanged; // New parameter for capturing input

  const CustomTextBox(
      {super.key,
      required this.hintText,
      this.isPassword = false,
      required this.icon,
      this.onChanged,
      required this.controller});

  @override
  _CustomTextBoxState createState() => _CustomTextBoxState();
}

class _CustomTextBoxState extends State<CustomTextBox> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.isPassword
          ? widget.onChanged
          : null, // Only call if isPassword
      obscureText: widget.isPassword ? _obscureText : false,
      keyboardType: widget.isPassword
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        filled: true,
        prefixIcon: Icon(
          widget.icon,
          color: Colors.grey[500],
        ),
        fillColor: Colors.grey[100],
        labelText: widget.hintText,
        labelStyle: TextStyle(color: Colors.orange[500]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: _togglePasswordVisibility,
              )
            : null,
      ),
    );
  }
}

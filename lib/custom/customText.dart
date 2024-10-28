import 'package:flutter/material.dart';

class HoverUnderlineText extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final double size;

  const HoverUnderlineText({
    super.key,
    required this.text,
    required this.onTap,
    required this.size,
  });

  @override
  _HoverUnderlineTextState createState() => _HoverUnderlineTextState();
}

class _HoverUnderlineTextState extends State<HoverUnderlineText> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: widget.size,
            decoration:
                _isHovering ? TextDecoration.underline : TextDecoration.none,
          ),
        ),
      ),
    );
  }
}

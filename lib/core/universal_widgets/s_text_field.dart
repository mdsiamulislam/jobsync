import 'package:flutter/material.dart';

class STextField extends StatefulWidget {
  String lebelText;
  IconData prefixIcon;
  TextInputType keyboardType;
  bool isObscure = false;

  STextField({
    super.key,
    required this.lebelText,
    required this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.isObscure = false
  });

  @override
  State<STextField> createState() => _STextFieldState();
}

class _STextFieldState extends State<STextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isObscure,
      focusNode: _focusNode,
      keyboardType: widget.keyboardType,
      cursorColor: Colors.blue,
      style: TextStyle(
        color: _isFocused ? Colors.blue : Colors.grey,
      ),
      decoration: InputDecoration(
        labelText: widget.lebelText,
        labelStyle: TextStyle(
          color: _isFocused ? Colors.blue : Colors.grey,
        ),
        prefixIcon: Icon(
          widget.prefixIcon,
          color: _isFocused ? Colors.blue : Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}

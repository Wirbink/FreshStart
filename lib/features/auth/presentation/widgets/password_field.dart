import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  PasswordField({this.validator, this.controller});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Contraseña',
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: _togglePasswordVisibility,
        ),
      ),
      validator: widget.validator,
    );
  }
}

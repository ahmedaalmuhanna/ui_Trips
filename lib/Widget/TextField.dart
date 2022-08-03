import 'package:flutter/material.dart';

class myTextField extends StatelessWidget {
  const myTextField({
    Key? key,
    required TextEditingController textField,
    required this.hintText,
    required this.myIcone,
    required this.isPassword,
  })  : _textField = textField,
        super(key: key);

  final TextEditingController _textField;
  final String hintText;
  final Icon myIcone;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _textField,
        decoration: InputDecoration(
          labelText: hintText,
          border: OutlineInputBorder(),
          hintText: hintText,
          prefixIcon: myIcone,
        ),
        obscureText: isPassword,
      ),
    );
  }
}

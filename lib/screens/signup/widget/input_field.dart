import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hint;
  final bool obscure;
  final IconData icon;
  final Stream<String> stream;
  final Function(String) onChanged;
  final TextEditingController controller;

  InputField({this.hint, this.obscure, this.icon, this.stream, this.onChanged, this.controller});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Colors.white24,
        width: 0.5,
      ))),
      child: StreamBuilder<String>(
        stream: stream,
        builder: (context, snapshot) {
          
          return TextField(
            controller: controller,
            onChanged: onChanged,
            obscureText: obscure,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 30, right: 30, left: 5),
                icon: Icon(
                  icon,
                  color: Colors.white,
                ),
                border: InputBorder.none,
                hintText: hint,
                hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                errorText: snapshot.hasError ? snapshot.error : null,
            ),
          );
        },
      ),
    );
  }
}
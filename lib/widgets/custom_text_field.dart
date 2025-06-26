import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText, this.maxLines = 1});
  final int maxLines;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: kPrimaryColor),
        enabledBorder: buildBorder(borderColor: Colors.white),
        focusedBorder: buildBorder(borderColor: kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder({Color borderColor = Colors.white}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: borderColor),
      borderRadius: BorderRadius.circular(10),
    );
  }
}

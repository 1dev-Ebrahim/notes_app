import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.maxLines = 1,
    this.onChanged,
    this.controller,
    this.closeIcon,
    this.onPressed,
  });
  final int maxLines;
  final String hintText;
  final void Function(String?)? onChanged;
  final TextEditingController? controller;
  final bool? closeIcon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'This field can\'t be empty';
        } else {
          return null;
        }
      },
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: kPrimaryColor),
        suffixIcon:
            closeIcon == null
                ? null
                : IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: onPressed!,
                ),
        border: buildBorder(borderColor: Colors.white),
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

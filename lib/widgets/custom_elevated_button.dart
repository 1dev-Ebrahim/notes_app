import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.isLoading,
  });
  final String buttonText;
  final VoidCallback onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        backgroundColor: WidgetStateProperty.all(kPrimaryColor),
        minimumSize: WidgetStateProperty.all(
          Size(MediaQuery.of(context).size.width, 55),
        ),
      ),
      child:
          isLoading
              ? const SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(color: Colors.blue),
              )
              : Text(
                buttonText,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
    );
  }
}

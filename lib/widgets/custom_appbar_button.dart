import 'package:flutter/material.dart';

class CustomAppBarButton extends StatelessWidget {
  const CustomAppBarButton({
    super.key,
    required this.iconData,
    required this.onPressed,
  });
  final IconData iconData;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0),
        splashFactory: InkRipple.splashFactory,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        minimumSize: const Size(45, 45),
      ),
      child: Icon(iconData, size: 27),
    );
  }
}

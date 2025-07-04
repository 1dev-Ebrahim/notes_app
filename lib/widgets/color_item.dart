import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isSelected, required this.color});
  final bool isSelected;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CircleAvatar(
          backgroundColor: const Color.fromARGB(80, 158, 158, 158),
          radius: 38.5,
          child: CircleAvatar(backgroundColor: color, radius: 32),
        )
        : CircleAvatar(backgroundColor: color, radius: 30);
  }
}

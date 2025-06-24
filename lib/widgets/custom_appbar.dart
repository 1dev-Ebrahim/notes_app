import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_search_button.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Notes', style: TextStyle(fontSize: 22)),
          CustomSearchButton(),
        ],
      ),
    );
  }
}


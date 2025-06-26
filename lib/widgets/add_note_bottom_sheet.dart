import 'package:flutter/material.dart';
import 'package:notes_app/widgets/cusom_elevated_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 150),
      curve: Curves.ease,
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: const SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(hintText: 'Title'),
            SizedBox(height: 20),
            CustomTextField(hintText: 'Content', maxLines: 5),
            SizedBox(height: 80),
            CustomElevatedButton(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

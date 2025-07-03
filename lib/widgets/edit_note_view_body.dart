import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          CustomTextField(hintText: 'Title', ),
          SizedBox(height: 20),
          CustomTextField(hintText: 'Content', maxLines: 5),
        ],
      ),
    );
  }
}

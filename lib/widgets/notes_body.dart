import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_appbar.dart';

class NotesBody extends StatelessWidget {
  const NotesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [CustomAppbar()]);
  }
}

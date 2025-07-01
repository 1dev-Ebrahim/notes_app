import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_state.dart';
import 'package:notes_app/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 0),
      curve: Curves.ease,
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailureState) {
            log(state.errorMessage);
            print(state.errorMessage);
            customSnackBar(
              context,
              contentText: 'Unexpected error occoured please try again',
              backgroundColor: Colors.red,
            );
          } else if (state is AddNoteSuccessState) {
            print('Scuccess!');
            customSnackBar(
              context,
              contentText: 'Note has been added successfully',
              backgroundColor: Colors.green,
            );
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is AddNoteLoadingState ? true : false,
            child: const AddNoteForm(),
          );
        },
      ),
    );
  }

  void customSnackBar(
    BuildContext context, {
    required String contentText,
    Color? backgroundColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: Text(contentText, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}

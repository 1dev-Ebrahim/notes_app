import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_app/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: AnimatedPadding(
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
              customSnackBar(
                context,
                contentText: 'An Error has Occoured, Please Try Again',
                backgroundColor: Colors.red,
              );
            } else if (state is AddNoteSuccessState) {
              Navigator.pop(context);
              customSnackBar(
                context,
                contentText: 'New Note Added has been Successfully',
                backgroundColor: Colors.green,
              );
            }
          },
          builder:
              (context, state) => AbsorbPointer(
                absorbing: state is AddNoteLoadingState,
                child: const AddNoteForm(),
              ),
        ),
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

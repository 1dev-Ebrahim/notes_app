import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/color_item.dart';
import 'package:notes_app/widgets/color_item_list_view.dart';
import 'package:notes_app/widgets/custom_elevated_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});
  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  String? title, subTitle;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autoValidateMode,
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            hintText: 'Title',
            onChanged: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 20),
          CustomTextField(
            hintText: 'Content',
            maxLines: 5,
            onChanged: (value) {
              subTitle = value;
            },
          ),
          const SizedBox(height: 40),
          ColorItemListView(),
          const SizedBox(height: 40),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    NoteModel newNoteModel = NoteModel(
                      title: title!,
                      subTitle: subTitle!,
                      date: DateFormat('MMM d, yyyy').format(DateTime.now()),
                      color: 0,
                    );
                    BlocProvider.of<AddNoteCubit>(
                      context,
                    ).addNote(newNoteModel);
                    formKey.currentState!.save();
                  } else {
                    setState(() {
                      autoValidateMode = AutovalidateMode.always;
                    });
                  }
                  BlocProvider.of<NotesCubit>(context).fetchNotes();
                },
                buttonText: 'Add',
                isLoading: state is AddNoteLoadingState,
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

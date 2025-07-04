import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/edit_note_cubit/edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit() : super(EditNoteInitialState());
  String? title;
  String? subTitle;
  late Color color;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  setNote(String? title, String subTitle) {
    this.title = title;
    this.subTitle = subTitle;
  }
}

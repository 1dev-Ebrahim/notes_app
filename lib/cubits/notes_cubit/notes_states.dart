import 'package:notes_app/models/note_model.dart';

class NotesStates {}

class NotesInitialState extends NotesStates {}

class NotesLoadingState extends NotesStates {}

class NotesSuccessState extends NotesStates {
  final List<NoteModel> notes;

  NotesSuccessState({required this.notes});
}

class NotesFailureState extends NotesStates {
  final String errorMessage;

  NotesFailureState({required this.errorMessage});
}

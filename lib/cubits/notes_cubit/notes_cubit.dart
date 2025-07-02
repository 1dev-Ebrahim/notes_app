import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_states.dart';
import 'package:notes_app/models/note_model.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitialState()) {
    print('cubit created');
  }
  printCreated() {
    log('Testing the Cubit');
  }

  fetchNotes() {
    emit(NotesLoadingState());
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      List<NoteModel> notesList = noteBox.values.toList();
      emit(NotesSuccessState(notes: notesList));
    } catch (e) {
      emit(NotesFailureState(errorMessage: e.toString()));
    }
  }
}

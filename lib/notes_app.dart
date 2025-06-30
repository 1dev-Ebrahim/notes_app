import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/views/home_view.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AddNoteCubit())],
      child: MaterialApp(
        routes: {
          HomeView.id: (context) => const HomeView(),
          EditNoteView.id: (context) => const EditNoteView(),
        },
        initialRoute: HomeView.id,
        theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

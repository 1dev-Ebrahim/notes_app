import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/search_cubit/search_cubit.dart';
import 'package:notes_app/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import 'package:notes_app/widgets/notes_list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const String id = 'HomeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isSearching = false;
  IconData? appBarIcon = Icons.search;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (contextc) => const AddNoteBottomSheet(),
                  showDragHandle: true,
                  isScrollControlled: true,
                );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              backgroundColor: kPrimaryColor,
              child: const Icon(Icons.add, color: Colors.black),
            ),
            appBar: CustomAppBar(
              title: AnimatedSwitcher(
                duration: const Duration(milliseconds: 1000),
                child:
                    isSearching
                        ? CustomTextField(
                          hintText: 'search',
                          onChanged: (value) {
                            BlocProvider.of<SearchCubit>(
                              context,
                            ).changeSearchText(value!);
                          },
                          closeIcon: true,
                          onPressed: () {
                            appBarIcon = Icons.search;
                            isSearching = false;
                            setState(() {});
                          },
                        )
                        : const Text('Notes', style: TextStyle(fontSize: 25)),
              ),
              iconData: appBarIcon,
              onPressed: () {
                isSearching = true;
                appBarIcon = null;
                setState(() {});
              },
            ),
            body: const NotesListView(),
          );
        },
      ),
    );
  }
}

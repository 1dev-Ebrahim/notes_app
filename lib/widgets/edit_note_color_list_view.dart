import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/edit_note_cubit/edit_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/color_item.dart';

class EditNoteColorListView extends StatefulWidget {
  const EditNoteColorListView({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  State<EditNoteColorListView> createState() => _EditNoteColorListViewState();
}

class _EditNoteColorListViewState extends State<EditNoteColorListView> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kNotesColors.indexOf(Color(widget.noteModel.color));
    BlocProvider.of<EditNoteCubit>(context).color = Color(
      widget.noteModel.color,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kNotesColors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                BlocProvider.of<EditNoteCubit>(context).color = Color(
                  kNotesColors[index].value,
                );
                setState(() {});
              },
              child: ColorItem(
                isSelected: index == currentIndex,
                color: kNotesColors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/widgets/color_item.dart';

class AddNoteColorItemListView extends StatefulWidget {
  const AddNoteColorItemListView({super.key});
  @override
  State<AddNoteColorItemListView> createState() =>
      _AddNoteColorItemListViewState();
}

class _AddNoteColorItemListViewState extends State<AddNoteColorItemListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kNotesColors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: index == currentIndex ? 2 : 4.0,
            ),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                BlocProvider.of<AddNoteCubit>(context).color =
                    kNotesColors[index];
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


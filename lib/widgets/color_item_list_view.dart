import 'package:flutter/widgets.dart';
import 'package:notes_app/widgets/color_item.dart';

class ColorItemListView extends StatelessWidget {
  const ColorItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: ColorItem(),
          );
        },
      ),
    );
  }
}

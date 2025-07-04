import 'package:flutter/widgets.dart';
import 'package:notes_app/widgets/color_item.dart';

class ColorItemListView extends StatefulWidget {
  const ColorItemListView({super.key});

  @override
  State<ColorItemListView> createState() => _ColorItemListViewState();
}

class _ColorItemListViewState extends State<ColorItemListView> {
  int currentIndex = 0;
  List<Color> colors = const [
    Color(0xffFFCC80),
    Color(0xffEDA2C0),
    Color(0xffD741A7),
    Color(0xff9DACFF),
    Color(0xff34F6F2),
    Color(0xff1F7A8C),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: index == currentIndex ? 2 : 4.0,
            ),
            child: GestureDetector(
              child: ColorItem(
                isSelected: index == currentIndex,
                color: colors[index],
              ),
              onTap: () {
                currentIndex = index;
                setState(() {});
              },
            ),
          );
        },
      ),
    );
  }
}

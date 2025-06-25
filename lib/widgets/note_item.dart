import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 24, bottom: 24, left: 24, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xffFFCC80),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            contentPadding: EdgeInsets.only(right: 0),
            enableFeedback: true,
            title: Text(
              'Flutter tips',
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Buid Your Career With Tharwat Samy',
                style: TextStyle(
                  color: const Color.fromARGB(125, 0, 0, 0),
                  fontSize: 18,
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              style: ButtonStyle(
                splashFactory: InkRipple.splashFactory,
                overlayColor: WidgetStateProperty.all(
                  const Color.fromARGB(34, 0, 0, 0),
                ),
              ),
              icon: Icon(FontAwesomeIcons.trash, color: Colors.black, size: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(
              'May 21,2022',
              style: TextStyle(
                color: const Color.fromARGB(125, 0, 0, 0),
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

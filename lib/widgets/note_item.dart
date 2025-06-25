import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24, bottom: 24, left: 24, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xffFFCC80),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.only(right: 0),
            enableFeedback: true,
            title: const Text(
              'I\'m Just A Note',
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Testing My Last Project In Course',
                style: TextStyle(
                  color: Color.fromARGB(125, 0, 0, 0),
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
              icon: const Icon(
                FontAwesomeIcons.trash,
                color: Colors.black,
                size: 24,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Text(
              'May 21,2022',
              style: TextStyle(
                color: Color.fromARGB(125, 0, 0, 0),
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

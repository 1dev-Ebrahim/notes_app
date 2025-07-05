import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_appbar_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.iconData,
    required this.onPressed,
  });
  final Widget title;
  final IconData? iconData;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: title,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child:
              iconData == null
                  ? null
                  : CustomAppBarButton(
                    iconData: iconData!,
                    onPressed: onPressed,
                  ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

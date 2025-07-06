import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/search_cubit/search_cubit.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class CustomSearchAppBar extends StatelessWidget
    implements PreferredSizeWidget {
    
  const CustomSearchAppBar({super.key, required this.onPressed});
      final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: CustomTextField(
        hintText: 'search',
        onChanged: (value) {
          BlocProvider.of<SearchCubit>(context).changeSearchText(value!);
        },
        closeIcon: true,
        onPressed: onPressed,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

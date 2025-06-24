import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_appbar.dart';

class HomeView extends StatelessWidget {
  const HomeView.HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: CustomAppbar()));
  }
}

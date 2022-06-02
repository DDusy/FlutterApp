import 'package:flutter/material.dart';

import 'c_academy.dart';

class FavoritedWidget extends StatefulWidget {
  const FavoritedWidget({Key? key}) : super(key: key);

  @override
  State<FavoritedWidget> createState() => _FavoritedWidgetState();
}

class _FavoritedWidgetState extends State<FavoritedWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        academy_button(msg: 'Hello'),
        academy_button(msg: 'My'),
        academy_button(msg: 'Name'),
        academy_button(msg: 'Is'),
        academy_button(msg: 'GimDonGuk'),
        academy_button(msg: 'GimDonGuk'),
        academy_button(msg: 'GimDonGuk'),
        academy_button(msg: 'GimDonGuk'),
        academy_button(msg: 'GimDonGuk'),
        academy_button(msg: 'GimDonGuk'),
        academy_button(msg: 'GimDonGuk'),
      ],
    );
  }
}
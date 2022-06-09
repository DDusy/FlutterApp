import 'package:flutter/material.dart';

class LabelTapbar extends StatefulWidget {
  final Text label;
  final double height;

  const LabelTapbar({Key? key, required this.label, required this.height})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _LabelTapbarState createState() => _LabelTapbarState(label, height);
}

class _LabelTapbarState extends State<LabelTapbar> {
  Text label;
  double height;

  _LabelTapbarState(this.label, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(0, 255, 255, 255),
      alignment: Alignment.center,
      child: label,
    );
  }
}

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FilledButton extends StatefulWidget {
  
  final Text hintText;
  final VoidCallback func;
  final Color mainColor;

  bool enabledbutton = false;
  bool isVisible;

  FilledButton(
      {Key? key,
      required this.hintText,
      required this.func,
      required this.mainColor,
      this.enabledbutton = false,
      this.isVisible = false})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<FilledButton> createState() =>
      _FilledButtonState(hintText, func, mainColor, isVisible);
}

class _FilledButtonState extends State<FilledButton> {
  Text hintText;
  VoidCallback func;
  Color mainColor;

  bool isVisible;

  _FilledButtonState(this.hintText, this.func, this.mainColor, this.isVisible);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
              // Text Color
              onPrimary:
                  Colors.white, //Theme.of(context).colorScheme.onPrimary,
              // Box Color
              primary: mainColor//Theme.of(context).colorScheme.primary,
              )
          .copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
      onPressed: func,
      child: hintText,
    );
  }
}
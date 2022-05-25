import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FilledButton extends StatefulWidget {
  final Text hintText;
  final VoidCallback func;
  bool enabledbutton = false;
  bool isVisible;

  FilledButton(
      {Key? key,
      required this.hintText,
      required this.func,
      this.enabledbutton = false,
      this.isVisible = false})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<FilledButton> createState() =>
      _FilledButtonState(hintText, func, isVisible);
}

class _FilledButtonState extends State<FilledButton> {
  Text hintText;
  VoidCallback func;

  bool isVisible;

  _FilledButtonState(this.hintText, this.func, this.isVisible);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
              // Text Color
              onPrimary:
                  Colors.white, //Theme.of(context).colorScheme.onPrimary,
              // Box Color
              primary: Colors.black //Theme.of(context).colorScheme.primary,
              )
          .copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
      onPressed: func,
      child: hintText,
    );
  }
}
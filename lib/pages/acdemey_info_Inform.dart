import 'package:flutter/material.dart';

class TabInform extends StatefulWidget {
  
  
  const TabInform({Key? key}) : super(key: key);
  

  @override
  _TabInformState createState() => _TabInformState();
}

class _TabInformState extends State<TabInform>{

  
  _TabInformState();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[200],
      alignment: Alignment.center,
      child: const Text(
        'inform',
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }
}

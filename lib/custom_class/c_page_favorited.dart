import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myflutterapp/custom_class/c_filledbutton.dart';
import 'package:myflutterapp/custom_class/c_global.dart';

import 'c_academybutton.dart';

class FavoritedWidget extends StatefulWidget {
  final bool empty;
  const FavoritedWidget({Key? key, required this.empty}) : super(key: key);

  @override
  State<FavoritedWidget> createState() => _FavoritedWidgetState(empty);
}

class _FavoritedWidgetState extends State<FavoritedWidget> {

  bool empty;

  _FavoritedWidgetState(this.empty);

  @override
  void setState(VoidCallback fn) {

    empty = service.User.favorited.isEmpty;

    super.setState(fn);
  }

  void addList() {
    print('asdf');
    setState(() {
      service.User.favorited.add('asdf');
    },);
  }

  Widget makeViewByList() {
    if(service.User.favorited.isEmpty) {
      // return Text('There is no item');
      // return ListView(
      //   children: [
      //     AcademyButton(msg: 'My'),
      //     AcademyButton(msg: 'Name'),
      //     AcademyButton(msg: 'Is'),
      //     AcademyButton(msg: 'GimDonGuk'),
      //   ],
      // );
      return FilledButton(hintText: Text('asdf'), func: addList, mainColor: Colors.purple);
    }
    else {
      //print(service.User.favorited);
      return ListView(
        children: [
          AcademyButton(msg: service.User.favorited[0]),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return makeViewByList();
  }
}
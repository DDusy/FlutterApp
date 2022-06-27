import 'package:flutter/material.dart';

import 'c_user.dart';

class MyService {

  static final MyService _instance = MyService._internal();

  // passes the instantiation to the _instance object
  factory MyService() => _instance;

  //initialize variables in here
  MyService._internal() {

    String email = "";
    String name = "";
    List<String> favorited = [];
    Map reserve = Map();

    _user = CustomUser(email, name, favorited, reserve);
  }

  late CustomUser _user;

  //short getter for my variable
  CustomUser get user => _user;

  //short setter for my variable
  set curUser(CustomUser value) => _user = value;

  void navigatorPush(BuildContext context, dynamic dst) {
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => dst,
        ),
      );
  }

  void navigatorPushReplacement(BuildContext context, dynamic dst) {
    Navigator.pushReplacement<void, void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => dst,
      ),
    );
  }

  void navigatorPop(BuildContext context) {
    Navigator.pop(context);
  }

  String getDateString(DateTime date) {
    String dateString = "";

    int hour = date.day >= 13 ? date.day - 12 : date.day;

    dateString += date.year.toString() + "년 ";
    dateString += date.month.toString() + "월 ";
    dateString += date.day.toString() + "일 ";
    dateString += (date.day>=13 ? "오후 " : "오전 ") + hour.toString() + "시 ";
    dateString += date.minute.toString() + "분";

    return dateString;
  }

  // void printUserData(){
  //   print(User.email);
  //   print(User.name);
  //   print(User.favorited);
  //   print(User.reserve);
  // }

  void createSnackBar(BuildContext context, String message){
    final scaffold = ScaffoldMessenger.of(context);

    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: 'OK',
          onPressed: scaffold.hideCurrentSnackBar,
        )
      ),
    );
  }
}

String convertDateToString(DateTime time) {

  String res = "";

  return res;
}

DateTime convertStringToDate(String time) {

  DateTime res = DateTime(2022,06,01);

  return res;
}

MyService service = MyService();
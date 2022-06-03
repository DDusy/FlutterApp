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
  CustomUser get User => _user;

  //short setter for my variable
  set curUser(CustomUser value) => _user = value;

  void printUserData(){
    print(User.email);
    print(User.name);
    print(User.favorited);
    print(User.reserve);
  }

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

MyService service = MyService();
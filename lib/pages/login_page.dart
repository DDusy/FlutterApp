// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

import 'package:myflutterapp/custom_class/c_filledbutton.dart';
import 'package:myflutterapp/custom_class/c_global.dart';
import 'package:myflutterapp/custom_class/c_inputfield.dart';
import 'package:myflutterapp/custom_class/c_user.dart';
import 'package:myflutterapp/pages/forgot_password_page.dart';

import 'package:myflutterapp/pages/signup_route.dart';
import 'package:myflutterapp/main.dart';
import 'package:myflutterapp/pages/main_page.dart';

import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:myflutterapp/pages/acdemey_info_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var buttontest = GestureDetector();

  bool isemptyemail = true;
  bool isemptypassword = true;

  CustomUser user = CustomUser('','', [], Map());

  //BuildContext _context;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  bool checkController(TextEditingController controller) {
    return controller.text.isEmpty;
  }

  void signin() async {
    if (checkController(emailController)) {
      service.createSnackBar(context, 'Please enter email');
      return;
    } else if (checkController(passwordController)) {
      service.createSnackBar(context, 'Please enter password');
      return;
    }

    var instance = FirebaseAuth.instance;
    bool bcomplete = true;

    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      // print('enter FirebaseAuthException Catch');
      // print(e.code);
      service.createSnackBar(context, e.code);
      bcomplete = false;
    } catch (e) {
      // print('Catch');
      bcomplete = false;
    }

    if(!bcomplete){
      return;
    }

    if (instance.currentUser!.emailVerified) {
      //String name = instance.currentUser!.displayName.toString();
      String email = instance.currentUser!.email.toString();

      await getDataByDB(email);
      service.createSnackBar(context, 'Hello!');

      service.curUser = user;

      //Navigator push signin->main

      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => MainPage(),
        ),
      );
    } 
    else {
      await instance.currentUser!.sendEmailVerification();
      service.createSnackBar(context, 'Please verify your email');
    }
  }

  Future<void> getDataByDB(String email) async{    
    var store = FirebaseFirestore.instance;

    String name = "";
    List<String> favorited = [];
    Map reserve = Map();

    var v = await store.collection('Users').doc(email).get();

    for (var item in await v.get('favorited')) {
      favorited.add(item);
    }
    name = await v.get('name');
    reserve = await v.get('reserve');

    user.email = email;
    user.name = name;
    user.favorited = favorited;
    user.reserve = reserve;

    return;
  }

  void signup() { 
    Navigator.push( 
        context, 
        MaterialPageRoute(builder: (context) => const signup_route())
    );
  }

  void reset() {
    Navigator.push( 
        context, 
        MaterialPageRoute(builder: (context) => const ForgotPasswordPage())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'App Name',
              style: TextStyle(
                fontSize: 44,
                color: Colors.black,
              ),
            ),
            InputField(
                hintText: 'Email Address',
                padding: const EdgeInsets.only(left: 10),
                margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                controller: emailController,
                type: TextInputType.emailAddress),
            InputField(
              hintText: 'Password',
              padding: const EdgeInsets.only(left: 10),
              margin: const EdgeInsets.fromLTRB(15, 20, 15, 25),
              isPassword: true,
              controller: passwordController,
              type: TextInputType.visiblePassword
            ),

            FilledButton(hintText: const Text('Sign in'), func: signin, mainColor: MyApp.mainColor),

            const Padding(padding: EdgeInsets.only(top:30)),

            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.black,
              ),
              onPressed: signup,
              child: const Text('Sign up'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.black,
              ),
              onPressed: reset,
              child: const Text('Forgot Password'),
            ),
          ],
        ),
      ),
    );
  }
}
/*
// ignore: must_be_immutable
class InputField extends StatefulWidget {
  
  final EdgeInsets padding;
  final EdgeInsets margin;
  final String hintText;

  bool isPassword = false;
  bool isVisible;

  InputField({
    Key? key,
    required this.padding,
    required this.margin,
    required this.hintText,
    this.isPassword = false,
    this.isVisible = false}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<InputField> createState() => _InputFieldState(
    padding, margin, hintText, isPassword, isVisible
  );
}

class _InputFieldState extends State<InputField> {
  
  EdgeInsets padding;
  EdgeInsets margin;
  String hintText;

  bool isPassword = false;
  bool isVisible;

  _InputFieldState(
    this.padding,
    this.margin,
    this.hintText,
    this.isPassword,
    this.isVisible);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 246, 233),
        border: Border.all(color: Colors.black),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: TextField(
        obscureText: isPassword ? !isVisible : false,
        decoration: InputDecoration(
          labelText: hintText,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          suffixIcon: isPassword ? InkWell(
            onTap: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
            child: Icon(
              isVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
              color: const Color.fromARGB(255, 111, 111, 111),
              size: 22
            )
          ) : null,
        ),
        style: const TextStyle(fontSize: 15),
        keyboardType: isVisible ? TextInputType.visiblePassword : TextInputType.emailAddress,
      ),
    );
  }
}
*/

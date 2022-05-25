import 'package:flutter/material.dart';

import 'package:myflutterapp/custom_class/c_inputfield.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class signup_route extends StatefulWidget {
  const signup_route({Key? key}) : super(key: key);

  @override
  State<signup_route> createState() => _signup_route();
}

class _signup_route extends State<signup_route> {

  var newuserEmailController = TextEditingController();
  // var newuserNameController = TextEditingController();
  var newuserPasswordController = TextEditingController();

  late String _email = "";
  late String _password = "";
  late double _strength = 0;
  late String _displayText = "";

  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z0-9].*");
  RegExp speciReg = RegExp(r'.*[!@#$%^&*(),.?":{}|<>].*');

  void _checkPassword(String value) {
    _password = value.trim();

    if (_password.isEmpty) {
      setState(() {
        _strength = 0;
      });
    } else if (_password.length < 6) {
      setState(() {
        _strength = 0.25;
        _displayText = 'Your password is too short';
      });
    } else if (_password.length < 9) {
      setState(() {
        _strength = 0.5;
        _displayText = 'Your password is acceptable but not strong';
      });
    } else {
      if (!letterReg.hasMatch(_password) ||
          !numReg.hasMatch(_password) ||
          !speciReg.hasMatch(_password)) {
        setState(() {
          _strength = 0.75;
          _displayText = 'Your password is strong';
        });
      } else {
        setState(() {
          _strength = 1;
          _displayText = 'Your password is great';
        });
      }
    }
  }

  void signup() async {
    UserCredential userCredential;

    try{
      userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: newuserEmailController.text,
        password: newuserPasswordController.text
      );
    } 
    on FirebaseAuthException catch (e){
      if(e.code == 'weak-password'){
        print('is too weak');
      }
      else if(e.code == 'email-already-in-use'){
        print('is already use');
      }
      else if(e.code == 'invalid-email'){
        print('invalid email');
      }
    }
    catch(e){
      print(e);
    }
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("SignUp"),
        ),
        body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 50),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              // Email Address
              Container(
                padding: const EdgeInsets.only(left: 10),
                margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 246, 233),
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                child: TextField(
                  obscureText: false,
                  controller: newuserEmailController,
                  decoration: const InputDecoration(
                    labelText: 'Email Address',
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  style: const TextStyle(fontSize: 15),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),

              // Password
              Container(
                padding: const EdgeInsets.only(left: 10),
                margin: const EdgeInsets.fromLTRB(15, 20, 15, 25),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 246, 233),
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                child: TextField(
                  onChanged: (value) => _checkPassword(value),
                  obscureText: false,
                  controller: newuserPasswordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  style: const TextStyle(fontSize: 15),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),

              SizedBox(
                width: 400,
                height: 25,
                child: LinearProgressIndicator(
                  value: _strength,
                  backgroundColor: Colors.grey[300],
                  color: _strength <= 1 / 4
                      ? Colors.red
                      : _strength == 2 / 4
                          ? Colors.yellow
                          : _strength == 3 / 4
                              ? Colors.blue
                              : Colors.green,
                  minHeight: 20,
                ),
              ),

              Text(
                _displayText,
                style: const TextStyle(fontSize: 15),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 246, 233),
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                child: TextButton(
                  onPressed: signup,
                  child: const Text('가입하기'),
                ),
              ),
            ])));
  }
}
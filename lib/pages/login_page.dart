import 'signup_route.dart';

import 'package:flutter/material.dart';
import 'package:myflutterapp/pages/signup_route.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top:50),
        
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
            ),

            InputField(
              hintText: 'Password',
              padding: const EdgeInsets.only(left: 10),
              margin: const EdgeInsets.fromLTRB(15, 20, 15, 25),
              isPassword: true,
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                // Text Color
                onPrimary: Colors.white,//Theme.of(context).colorScheme.onPrimary,
                // Box Color
                primary: Colors.black//Theme.of(context).colorScheme.primary,
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
              onPressed: () {

              }, 
              child: const Text('Sign in'),
            ),
            const Padding(padding: EdgeInsets.only(top:30)),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>const signup_route())
                );
              },
              child: const Text('Sign up'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.black,
              ),
              onPressed: () {

              },
              child: const Text('Forgot Password'),
            ),
          ],
        ),
      ),
    );
  }
}

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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/Material.dart';

import '../custom_class/c_filledbutton.dart';
import '../custom_class/c_inputfield.dart';
import '../main.dart';

class forgot_password_page extends StatefulWidget {
  const forgot_password_page({Key? key}) : super(key: key);

  @override
  State<forgot_password_page> createState() => _forgot_password_pageState();
}

class _forgot_password_pageState extends State<forgot_password_page> {
  
  //var nameController = TextEditingController();
  var emailController = TextEditingController();
  
  void reset() async {
    if(emailController.text.isEmpty){
      MyApp.createSnackBar(context, 'Please enter email');
      return;
    }

    var instance = FirebaseAuth.instance;
    bool bcomplete = true;

    try {
      await instance.sendPasswordResetEmail(email: emailController.text);
    } 
    on FirebaseAuthException catch (e) {
      MyApp.createSnackBar(context, e.code);
      bcomplete = false;
    }
    catch (e) {
      bcomplete = false;
    }

    if(bcomplete){
      MyApp.createSnackBar(context, 'Check your email');
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forgot Password')),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top:50),
        child: Column(
          children: [
            // InputField(
            //   hintText: 'Name',
            //   padding: const EdgeInsets.only(left: 10),
            //   margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
            //   controller: nameController,
            //   type: TextInputType.text,
            // ),

            // Email Address
            InputField(
              hintText: 'Email Address',
              padding: const EdgeInsets.only(left: 10),
              margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              controller: emailController,
              type: TextInputType.emailAddress,
            ),

            Padding(padding: EdgeInsets.only(top:40)),

            FilledButton(hintText: Text("Reset"), func: reset, mainColor: Colors.purple,)
          ],
        ),
      ),
    );
  }
}
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'pages/login_page.dart';
// import 'pages/main_page.dart';
// import 'custom_class/c_user.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static Color mainColor = Colors.purple;
  static Color subColor = Color.fromARGB(255, 206, 153, 215);

  static void createSnackBar(BuildContext context, String message){
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple),
      home: LoginPage(),
    );
  }
}

/*
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: const Color.fromARGB(255, 30, 12, 80), useMaterial3: true,
      ),
      home: const ButtonSample(),
    );
  }
}

class ButtonSample extends StatelessWidget {
  const ButtonSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(),
        body: Container(

          alignment: Alignment.center,
          padding: const EdgeInsets.only(top:50),
          
          child: Column(  
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              const Text(
                'App Name', 
                style: TextStyle(fontSize: 44)
              ),
          
              // Email Address
              Container(
                padding: EdgeInsets.only(left: 10),
                margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
                width: double.infinity, height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 246, 233),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: const TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: TextStyle(fontSize: 15),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              
              // Password
              Container(
                padding: EdgeInsets.only(left: 10),
                margin: EdgeInsets.fromLTRB(15, 20, 15, 25),
                width: double.infinity, height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 246, 233),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: const TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: TextStyle(fontSize: 15),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // Text Color
                  onPrimary: Colors.white,//Theme.of(context).colorScheme.onPrimary,
                  // Box Color
                  primary: Colors.black//Theme.of(context).colorScheme.primary,
                ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                onPressed: () {print('Sign in');}, 
                child: Text('Sign in'),
              ),
              const Padding(padding: EdgeInsets.only(top:30)),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
                onPressed: () {print('Sign up');},
                child: const Text('Sign up'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
                onPressed: () {print('Forgot Password');},
                child: const Text('Forgot Password'),
              ),
            ],
          ),
        ),
      ); 
  }
}
*/

// Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: GestureDetector(
  //         behavior: HitTestBehavior.translucent,
  //         onTap: () async {
  //           var f = FirebaseFirestore.instance;
  //           await f.collection('ODRUM_ONE').doc('settings').get().then((value) => {
  //             print(value.data())
  //           });
  //         },
  //         child: Container(
  //           padding: EdgeInsets.all(13),
  //           decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.grey), borderRadius: BorderRadius.circular(12)),
  //           child: Text('보내기', style: TextStyle(fontSize: 25),)
  //         ),
  //       ),
  //     ),
  //   );
  // }
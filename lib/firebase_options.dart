// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDN9Ql8Nwberei0sUoHE6UnFsPJgXx7Yiw',
    appId: '1:999512416353:web:045745585e3c3a10d90a20',
    messagingSenderId: '999512416353',
    projectId: 'fir-withfluuter',
    authDomain: 'fir-withfluuter.firebaseapp.com',
    databaseURL: 'https://fir-withfluuter-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fir-withfluuter.appspot.com',
    measurementId: 'G-7XS4G88DYK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBMHn9jQtOII4F5cVlpetoQi0A8qdDd0nI',
    appId: '1:999512416353:android:964c1806a280eefbd90a20',
    messagingSenderId: '999512416353',
    projectId: 'fir-withfluuter',
    databaseURL: 'https://fir-withfluuter-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fir-withfluuter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAkqabKbcvwr-l1QPTq_cacdSXhe3JdL4o',
    appId: '1:999512416353:ios:4aea909382d7b6a6d90a20',
    messagingSenderId: '999512416353',
    projectId: 'fir-withfluuter',
    databaseURL: 'https://fir-withfluuter-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fir-withfluuter.appspot.com',
    iosClientId: '999512416353-us8rqji7ij4pivtrand59vv9aragq4au.apps.googleusercontent.com',
    iosBundleId: 'com.example.myflutterapp',
  );
}

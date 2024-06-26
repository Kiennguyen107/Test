// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyDRC8k97R0M31WXtLAvAVIxQUtyNzbgdjk',
    appId: '1:47645757479:web:6deb7e7676cb8230b7fe02',
    messagingSenderId: '47645757479',
    projectId: 'iot-app-576f0',
    authDomain: 'iot-app-576f0.firebaseapp.com',
    databaseURL: 'https://iot-app-576f0-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'iot-app-576f0.appspot.com',
    measurementId: 'G-CHYH1BNFZQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAOPvtB-BzuMIMT4Ij4ApxHjeyAyK6oRbM',
    appId: '1:47645757479:android:114beb98ec73bea0b7fe02',
    messagingSenderId: '47645757479',
    projectId: 'iot-app-576f0',
    databaseURL: 'https://iot-app-576f0-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'iot-app-576f0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBETcccHAYAxWdsj1h_4ydVH4tQjtk7_jA',
    appId: '1:47645757479:ios:79bb8aa9f393e513b7fe02',
    messagingSenderId: '47645757479',
    projectId: 'iot-app-576f0',
    databaseURL: 'https://iot-app-576f0-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'iot-app-576f0.appspot.com',
    iosBundleId: 'com.example.testProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBETcccHAYAxWdsj1h_4ydVH4tQjtk7_jA',
    appId: '1:47645757479:ios:79bb8aa9f393e513b7fe02',
    messagingSenderId: '47645757479',
    projectId: 'iot-app-576f0',
    databaseURL: 'https://iot-app-576f0-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'iot-app-576f0.appspot.com',
    iosBundleId: 'com.example.testProject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDRC8k97R0M31WXtLAvAVIxQUtyNzbgdjk',
    appId: '1:47645757479:web:5957893f3ba6d8a1b7fe02',
    messagingSenderId: '47645757479',
    projectId: 'iot-app-576f0',
    authDomain: 'iot-app-576f0.firebaseapp.com',
    databaseURL: 'https://iot-app-576f0-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'iot-app-576f0.appspot.com',
    measurementId: 'G-HERCTQGJ37',
  );
}

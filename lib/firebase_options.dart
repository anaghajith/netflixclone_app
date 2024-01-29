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
        return macos;
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
    apiKey: 'AIzaSyBCQu8s-v6ZSmm2cnp6WAJ5M5RKlYgEZY4',
    appId: '1:234572105405:web:c0ddc39c22c2e3580e19d4',
    messagingSenderId: '234572105405',
    projectId: 'netflixapp-23914',
    authDomain: 'netflixapp-23914.firebaseapp.com',
    storageBucket: 'netflixapp-23914.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAFUVNh7JIHOCfmazLuxFwolLcjmDTscI4',
    appId: '1:234572105405:android:4209d0b19b2b15090e19d4',
    messagingSenderId: '234572105405',
    projectId: 'netflixapp-23914',
    storageBucket: 'netflixapp-23914.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAfC_71SLBYn9Ep-i1oPQMBK-cuQ8urAmU',
    appId: '1:234572105405:ios:b35d8f2c345b13030e19d4',
    messagingSenderId: '234572105405',
    projectId: 'netflixapp-23914',
    storageBucket: 'netflixapp-23914.appspot.com',
    iosBundleId: 'com.example.flutflix',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAfC_71SLBYn9Ep-i1oPQMBK-cuQ8urAmU',
    appId: '1:234572105405:ios:ec762062f1e7bfcc0e19d4',
    messagingSenderId: '234572105405',
    projectId: 'netflixapp-23914',
    storageBucket: 'netflixapp-23914.appspot.com',
    iosBundleId: 'com.example.flutflix.RunnerTests',
  );
}

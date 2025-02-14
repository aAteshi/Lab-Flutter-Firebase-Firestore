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
    apiKey: 'AIzaSyAzbvuNo7LUwtJuTygVQQXyfMNW5HL6dOQ',
    appId: '1:628709696573:web:183942a248ecc0c5307654',
    messagingSenderId: '628709696573',
    projectId: 'flutter-firestore-7a121',
    authDomain: 'flutter-firestore-7a121.firebaseapp.com',
    storageBucket: 'flutter-firestore-7a121.firebasestorage.app',
    measurementId: 'G-KEJ2S1N4VQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC7hrHZkedpEbO-Q0EpjjFeEZFslCsqy6Q',
    appId: '1:628709696573:android:933d9945c9946893307654',
    messagingSenderId: '628709696573',
    projectId: 'flutter-firestore-7a121',
    storageBucket: 'flutter-firestore-7a121.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA8fJzMunM9UpiE6lLFolxGoif-bnkkwG4',
    appId: '1:628709696573:ios:368f6631f3c426ea307654',
    messagingSenderId: '628709696573',
    projectId: 'flutter-firestore-7a121',
    storageBucket: 'flutter-firestore-7a121.firebasestorage.app',
    iosBundleId: 'com.example.flutterFirebaseFirestore',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA8fJzMunM9UpiE6lLFolxGoif-bnkkwG4',
    appId: '1:628709696573:ios:368f6631f3c426ea307654',
    messagingSenderId: '628709696573',
    projectId: 'flutter-firestore-7a121',
    storageBucket: 'flutter-firestore-7a121.firebasestorage.app',
    iosBundleId: 'com.example.flutterFirebaseFirestore',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAzbvuNo7LUwtJuTygVQQXyfMNW5HL6dOQ',
    appId: '1:628709696573:web:b59deecca55e4a8a307654',
    messagingSenderId: '628709696573',
    projectId: 'flutter-firestore-7a121',
    authDomain: 'flutter-firestore-7a121.firebaseapp.com',
    storageBucket: 'flutter-firestore-7a121.firebasestorage.app',
    measurementId: 'G-M9K378SXBV',
  );
}

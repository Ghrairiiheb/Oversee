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
    apiKey: 'AIzaSyAfjLkjrwICbF3nTCzHxWI1xgXn1BS2otQ',
    appId: '1:641676903781:web:0b2e333e3dc2b575664d8c',
    messagingSenderId: '641676903781',
    projectId: 'gestion-conges-fe6a0',
    authDomain: 'gestion-conges-fe6a0.firebaseapp.com',
    storageBucket: 'gestion-conges-fe6a0.appspot.com',
    measurementId: 'G-G8FNEZREGD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyClDO7Q--ASoFr98FDkbntra09I5xFVYmw',
    appId: '1:641676903781:android:d907838dafde3cbf664d8c',
    messagingSenderId: '641676903781',
    projectId: 'gestion-conges-fe6a0',
    storageBucket: 'gestion-conges-fe6a0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDpYa5kKHiP4nuQ2S8JEEQyvYoYblFeXJM',
    appId: '1:641676903781:ios:cb4e0c64e0ec1c14664d8c',
    messagingSenderId: '641676903781',
    projectId: 'gestion-conges-fe6a0',
    storageBucket: 'gestion-conges-fe6a0.appspot.com',
    iosBundleId: 'com.example.gestionConge',
  );
}

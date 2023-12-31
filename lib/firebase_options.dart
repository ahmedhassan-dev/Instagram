// File generated by FlutterFire CLI.
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
    apiKey: 'AIzaSyA7Me4AKZPEkgNMzQzGZLHsuoTfvqf0FoY',
    appId: '1:389537202400:web:8f223a2299b9420fd39085',
    messagingSenderId: '389537202400',
    projectId: 'insta-9f751',
    authDomain: 'insta-9f751.firebaseapp.com',
    storageBucket: 'insta-9f751.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDQ7R9AAGHdzFhPPjAbCK2T3xdzbFOhSWE',
    appId: '1:389537202400:android:93a0b36be0203a49d39085',
    messagingSenderId: '389537202400',
    projectId: 'insta-9f751',
    storageBucket: 'insta-9f751.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDlLoKfadYwiavybWALxSgy2KBsvepLnrg',
    appId: '1:389537202400:ios:c51992575ac1d5a1d39085',
    messagingSenderId: '389537202400',
    projectId: 'insta-9f751',
    storageBucket: 'insta-9f751.appspot.com',
    iosBundleId: 'com.example.instagram',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDlLoKfadYwiavybWALxSgy2KBsvepLnrg',
    appId: '1:389537202400:ios:7a059a3e9eb8752ad39085',
    messagingSenderId: '389537202400',
    projectId: 'insta-9f751',
    storageBucket: 'insta-9f751.appspot.com',
    iosBundleId: 'com.example.instagram.RunnerTests',
  );
}

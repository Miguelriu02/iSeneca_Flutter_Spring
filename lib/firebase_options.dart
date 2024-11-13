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
    apiKey: 'AIzaSyB_zFoNqUpXP6up0MtoieOy57Da2ra5FBY',
    appId: '1:219390634437:web:476771abcaf90283db03ac',
    messagingSenderId: '219390634437',
    projectId: 'mix-iseneca-incidencias',
    authDomain: 'mix-iseneca-incidencias.firebaseapp.com',
    storageBucket: 'mix-iseneca-incidencias.firebasestorage.app',
    measurementId: 'G-TBNELZXK2X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBckw2xKR8jNIx-WZ8szP0tK38Hx9o3Hck',
    appId: '1:219390634437:android:9d4d58e976a577f2db03ac',
    messagingSenderId: '219390634437',
    projectId: 'mix-iseneca-incidencias',
    storageBucket: 'mix-iseneca-incidencias.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDnNp3jznEP4l4lLIo3GsuGzcmSr99sdlo',
    appId: '1:219390634437:ios:1ad9d257c9f7aa00db03ac',
    messagingSenderId: '219390634437',
    projectId: 'mix-iseneca-incidencias',
    storageBucket: 'mix-iseneca-incidencias.firebasestorage.app',
    iosClientId: '219390634437-gn3hequ76thr8qlhuloaglnd3coaoctk.apps.googleusercontent.com',
    iosBundleId: 'com.example.iseneca',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDnNp3jznEP4l4lLIo3GsuGzcmSr99sdlo',
    appId: '1:219390634437:ios:1ad9d257c9f7aa00db03ac',
    messagingSenderId: '219390634437',
    projectId: 'mix-iseneca-incidencias',
    storageBucket: 'mix-iseneca-incidencias.firebasestorage.app',
    iosClientId: '219390634437-gn3hequ76thr8qlhuloaglnd3coaoctk.apps.googleusercontent.com',
    iosBundleId: 'com.example.iseneca',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB_zFoNqUpXP6up0MtoieOy57Da2ra5FBY',
    appId: '1:219390634437:web:476771abcaf90283db03ac',
    messagingSenderId: '219390634437',
    projectId: 'mix-iseneca-incidencias',
    authDomain: 'mix-iseneca-incidencias.firebaseapp.com',
    storageBucket: 'mix-iseneca-incidencias.firebasestorage.app',
    measurementId: 'G-TBNELZXK2X',
  );

}
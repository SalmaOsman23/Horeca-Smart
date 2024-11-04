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
    apiKey: 'AIzaSyBtOEwFK5kTzBL18BLaXUk7YBlE53SvUc8',
    appId: '1:648041339040:web:cc7357aa6a44d5579851c5',
    messagingSenderId: '648041339040',
    projectId: 'horeca-smart-efaee',
    authDomain: 'horeca-smart-efaee.firebaseapp.com',
    storageBucket: 'horeca-smart-efaee.firebasestorage.app',
    measurementId: 'G-LS09C32J5F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBH5fHNvVxeNCXBeTZnxf5MSv88NwPH8cI',
    appId: '1:648041339040:android:a38f4dd03245c11d9851c5',
    messagingSenderId: '648041339040',
    projectId: 'horeca-smart-efaee',
    storageBucket: 'horeca-smart-efaee.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCbaFcelcYFNO_4k5XKGIEDJ_p9a8gawDs',
    appId: '1:648041339040:ios:1f9750b832e6f9199851c5',
    messagingSenderId: '648041339040',
    projectId: 'horeca-smart-efaee',
    storageBucket: 'horeca-smart-efaee.firebasestorage.app',
    iosBundleId: 'com.example.horecaSmart',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCbaFcelcYFNO_4k5XKGIEDJ_p9a8gawDs',
    appId: '1:648041339040:ios:1f9750b832e6f9199851c5',
    messagingSenderId: '648041339040',
    projectId: 'horeca-smart-efaee',
    storageBucket: 'horeca-smart-efaee.firebasestorage.app',
    iosBundleId: 'com.example.horecaSmart',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBtOEwFK5kTzBL18BLaXUk7YBlE53SvUc8',
    appId: '1:648041339040:web:5151640c74e77e739851c5',
    messagingSenderId: '648041339040',
    projectId: 'horeca-smart-efaee',
    authDomain: 'horeca-smart-efaee.firebaseapp.com',
    storageBucket: 'horeca-smart-efaee.firebasestorage.app',
    measurementId: 'G-3L3X72YJQZ',
  );
}

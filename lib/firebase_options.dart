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
    apiKey: 'AIzaSyDICanQupea4iVEgQgHDbuIJaABKQ5egws',
    appId: '1:951779994426:web:ec2e9850ca15e172e8be03',
    messagingSenderId: '951779994426',
    projectId: 'shoping-mall-f5563',
    authDomain: 'shoping-mall-f5563.firebaseapp.com',
    storageBucket: 'shoping-mall-f5563.firebasestorage.app',
    measurementId: 'G-DWQNJWDBMX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_g1OrdoiOl1tdyGfWfSbjS8ZPAKIQB7E',
    appId: '1:951779994426:android:46bb4f3110ae5dece8be03',
    messagingSenderId: '951779994426',
    projectId: 'shoping-mall-f5563',
    storageBucket: 'shoping-mall-f5563.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZb_2NGYRpL9hNAc9rkvpWwqa3Ap9C0CI',
    appId: '1:951779994426:ios:7986a1d272d05582e8be03',
    messagingSenderId: '951779994426',
    projectId: 'shoping-mall-f5563',
    storageBucket: 'shoping-mall-f5563.firebasestorage.app',
    iosBundleId: 'com.example.flutterApp1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCZb_2NGYRpL9hNAc9rkvpWwqa3Ap9C0CI',
    appId: '1:951779994426:ios:7986a1d272d05582e8be03',
    messagingSenderId: '951779994426',
    projectId: 'shoping-mall-f5563',
    storageBucket: 'shoping-mall-f5563.firebasestorage.app',
    iosBundleId: 'com.example.flutterApp1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDICanQupea4iVEgQgHDbuIJaABKQ5egws',
    appId: '1:951779994426:web:8aa750307989bab7e8be03',
    messagingSenderId: '951779994426',
    projectId: 'shoping-mall-f5563',
    authDomain: 'shoping-mall-f5563.firebaseapp.com',
    storageBucket: 'shoping-mall-f5563.firebasestorage.app',
    measurementId: 'G-KNGRW0VQSH',
  );
}

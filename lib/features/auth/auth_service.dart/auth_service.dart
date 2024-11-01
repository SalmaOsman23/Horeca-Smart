import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  //!Sign Up Function
  Future<User?> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credentials = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credentials.user;
    } catch (e) {
      log("Something Went Wrong");
    }
    return null;
  }
  //!Log In Function
  Future<User?> logInUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credentials = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credentials.user;
    } catch (e) {
      log("Something Went Wrong");
    }
    return null;
  }
  //!Log Out Function
  Future<void> logOutUserWithEmailAndPassword() async {
    try {
      await _auth.signOut();
    } catch (e) {
      log("Something Went Wrong");
    }
    return null;
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firestore_app/domain/user.dart';

class AuthService {
  final FirebaseAuth _fAuth = FirebaseAuth.instance;

  Future<FitUser> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _fAuth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return FitUser.fromFirebase(user);
    } catch (e) {
      return null;
    }
  }

  Future<FitUser> registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _fAuth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return FitUser.fromFirebase(user);
    } catch (e) {
      return null;
    }
  }

  Future logOut() async {
    await _fAuth.signOut();
  }

  Stream<FitUser> get currentUser {
    return _fAuth.authStateChanges().map((User user) => user != null ? FitUser.fromFirebase(user) : null);
  }
}

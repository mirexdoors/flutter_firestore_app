import 'package:firebase_auth/firebase_auth.dart';

class FitUser {
  String id;

  FitUser.fromFirebase(User user){
    id = user.uid;
  }
}
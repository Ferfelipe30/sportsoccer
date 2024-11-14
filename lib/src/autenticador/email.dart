import 'package:firebase_auth/firebase_auth.dart';

// ignore: camel_case_types
class email {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<User?> registroEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }

  Future<User?> loginEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}

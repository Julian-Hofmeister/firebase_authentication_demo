import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> signIn({String email, String password}) async {
    try {
      _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "SignIn Successful";
    } on FirebaseAuthException catch (e) {
      print("Sign In Error");
      return e.message;
    }
  }

  Future<String> signUp({String email, String password}) async {
    try {
      _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "SignUp Successful";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}

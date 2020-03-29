import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Anonymous sign in for debug
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInAnon() async {
    try {
      final AuthResult result = await _auth.signInAnonymously();

      if (result != null) {
        FirebaseUser user = result.user;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

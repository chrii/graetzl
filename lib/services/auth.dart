import 'package:firebase_auth/firebase_auth.dart';
import 'package:graetzl/models/user.dart';

class AuthService {
  // Anonymous sign in for debug
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => _userFromFirebaseUser(user));
  }

  Future signInAnon() async {
    try {
      final AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print('Sign Out Error ${e.toString()}');
    }
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      Future<AuthResult> result =
          _auth.signInWithEmailAndPassword(email: email, password: password);
      //FirebaseUser user = ;
      print(result);
      return result;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

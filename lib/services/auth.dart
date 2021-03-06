import 'package:authentication/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid, email: user.email) : null;
  }

  //auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => _userFromFirebaseUser(user));
  }

  //register email & password
  Future createUserWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      switch (e.code) {
        case 'ERROR_WEAK_PASSWORD':
          {
            return 'Password must be at least 6 characters';
          }
          break;
        case 'ERROR_INVALID_EMAIL':
          {
            return 'Email is invalid';
          }
          break;
        case 'ERROR_EMAIL_ALREADY_IN_USE':
          {
            return 'This email is already in use';
          }
      }
    }
  }

  //sign in email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      switch (e.code) {
        case 'ERROR_INVALID_EMAIL':
          {
            return 'Email address is malformed.';
          }
          break;

        case 'ERROR_WRONG_PASSWORD':
          {
            return 'Wrong password.';
          }
          break;

        case 'ERROR_USER_NOT_FOUND':
          {
            return 'User not found.';
          }
          break;

        case 'ERROR_USER_DISABLED':
          {
            return 'This user has been disabled.';
          }
          break;

        case 'ERROR_TOO_MANY_REQUESTS':
          {
            return 'Too many sign in attempts.';
          }
          break;

        case 'ERROR_OPERATION_NOT_ALLOWED':
          {
            return 'Email & password accounts are disabled.';
          }
      }
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

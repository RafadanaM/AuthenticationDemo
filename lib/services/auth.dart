import 'package:authentication/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid, email: user.email) : null;
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
}

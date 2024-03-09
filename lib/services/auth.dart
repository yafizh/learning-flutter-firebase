import 'package:firebase_auth/firebase_auth.dart';
import 'package:brew_crew/models/user.dart' as CustomUser;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  CustomUser.User? _userFromFirebaseUser(User? user) {
    return user != null ? CustomUser.User(uid: user.uid) : null;
  }

  Stream<CustomUser.User?> get user {
    return _auth
        .authStateChanges()
        // .map((User? user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;

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
      print(e.toString());
      return null;
    }
  }
}

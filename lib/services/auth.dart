import 'package:firebase_auth/firebase_auth.dart';
import 'package:brew_crew/models/user.dart' as CustomUser;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  CustomUser.User? _userFromFirebaseUser(User? user) {
    return user != null ? CustomUser.User(uid: user.uid) : null;
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
}

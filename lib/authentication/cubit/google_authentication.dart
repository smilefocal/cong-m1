import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoogleAuthentication {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    User? user;

    // The `GoogleAuthProvider` can only be used while running on the web.
    GoogleAuthProvider authProvider = GoogleAuthProvider();

    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithPopup(authProvider);
      user = userCredential.user;

      if (user != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('auth', true);
      }
    } catch (e) {
      rethrow;
    }
    return user;
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
  }
}

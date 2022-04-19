import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthentication {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    // Initialize Firebase
    await Firebase.initializeApp();
    User? user;

    // The `GoogleAuthProvider` can only be used while running on the web.
    GoogleAuthProvider authProvider = GoogleAuthProvider();

    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithPopup(authProvider);
      user = userCredential.user;
    } catch (e) {
      print(e);
    }
    return user;
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
  }
}

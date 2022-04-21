import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoogleAuthentication {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  //the values to store in shared preferences.
  late final String userId;
  late final String userEmail;
  late final String userName;
  late final String userImageurl;

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
      //At this point, I can store the value of this user to shared prefs.
      if (user != null) {
        userId = user.uid;
        userName = user.displayName!;
        userEmail = user.email!;
        userImageurl = user.photoURL!;

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('auth', true);
      }
    } catch (e) {
      print(e);
    }
    return user;
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('auth', false);

    userId = '';
    userName = '';
    userEmail = '';
    userImageurl = '';

    print("User signed out of Google account");
  }

  Future getUser() async {
    // Initialize Firebase
    await Firebase.initializeApp();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool authSignedIn = prefs.getBool('auth') ?? false;

    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (authSignedIn == true) {
        if (user != null) {
          return user;
        }
      }
    } catch (exception) {
      return;
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoogleAuthentication {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  String? name;
  String? imageUrl;
  String? uid;
  String? userEmail;

  Future<User?> signInWithGoogle() async {
    // Initialize Firebase
    await Firebase.initializeApp();
    User? user;

    // The `GoogleAuthProvider` can only be used while running on the web
    GoogleAuthProvider authProvider = GoogleAuthProvider();

    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithPopup(authProvider)
          .whenComplete(() {
        print("The display name recorded is: ${user!.displayName}");
      });

      user = userCredential.user;
    } catch (e) {
      print(e);
    }

    if (user != null) {
      uid = user.uid;
      name = user.displayName;
      userEmail = user.email;
      imageUrl = user.photoURL;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('auth', true);
    }

    return user;
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('auth', false);

    uid = null;
    name = null;
    userEmail = null;
    imageUrl = null;

    print("User signed out of Google account");
  }

  Future getUser() async {
    // Initialize Firebase
    await Firebase.initializeApp();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool authSignedIn = prefs.getBool('auth') ?? false;

    final User? user = FirebaseAuth.instance.currentUser;

    if (authSignedIn == true) {
      if (user != null) {
        uid = user.uid;
        name = user.displayName;
        userEmail = user.email;
        imageUrl = user.photoURL;
      }
    }
  }
}

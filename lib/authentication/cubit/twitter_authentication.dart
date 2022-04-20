import 'package:firebase_auth/firebase_auth.dart';

//Twitter signIn is currently not available.
class TwitterAuthentication {
  signInTwitterWithRedirect() async {
    return await FirebaseAuth.instance
        .signInWithRedirect(TwitterAuthProvider());
  }
}

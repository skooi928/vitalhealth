import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '/models/user.dart' as model;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> checkLoginStatus() async {
    User? user = _auth.currentUser;
    return user != null;
  }

  Future<bool> login(String email, String password) async {
    try {
      // Perform login logic here
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user != null;
    } catch (e) {
      // Handle login error
      print('Login failed: $e');
      return false;
    }
  }

  Future<model.User> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, get the UserCredential
    final UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    final User? firebaseUser = userCredential.user;

    // Create and return a custom User object
    if (firebaseUser != null) {
      return model.User(
        uid: firebaseUser.uid,
        email: firebaseUser.email ?? '',
        displayName: firebaseUser.displayName ?? '',
        profilePicUrl: firebaseUser.photoURL ?? '',
      );
    } else {
      throw Exception('Failed to sign in with Google');
    }
  }
}

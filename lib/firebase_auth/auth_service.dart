import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '/models/user.dart' as model;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> checkLoginStatus() async {
    User? user = _auth.currentUser;
    return user != null;
  }

  Future<bool> isEmailVerified() async {
    User? user = _auth.currentUser;
    await user
        ?.reload(); // Reload user to get the latest email verification status
    user = _auth.currentUser;
    return user?.emailVerified ?? false;
  }

  Future<bool> login(String email, String password) async {
    try {
      // Perform login logic here
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        bool emailVerified = await isEmailVerified();
        if (!emailVerified) {
          await _auth.signOut();
          throw Exception('Email not verified. Please verify your email.');
        }
        // Fetch user details
        String? displayName = firebaseUser.displayName;
        String? profilePicUrl = firebaseUser.photoURL;

        // Store user details in the UserCredentials singleton instance
        model.UserCredentials().email = firebaseUser.email ?? '';
        model.UserCredentials().displayName = displayName ?? '';
        model.UserCredentials().uid = firebaseUser.uid;
        model.UserCredentials().profilePicUrl = profilePicUrl ?? '';

        // Save user details to shared preferences
        await model.UserCredentials().saveToPreferences();

        return true;
      } else {
        return false;
      }
    } catch (e) {
      // Handle login error
      throw ('Login failed: ${e.toString()}');
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
      // Store user details in the UserCredentials singleton instance
      model.UserCredentials().email = firebaseUser.email ?? '';
      model.UserCredentials().uid = firebaseUser.uid;
      model.UserCredentials().displayName = firebaseUser.displayName ?? '';
      model.UserCredentials().profilePicUrl = firebaseUser.photoURL ?? '';

      // Save user details to shared preferences
      await model.UserCredentials().saveToPreferences();

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

  // Register New User
  Future<void> registerUser({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      bool emailVerified = await isEmailVerified();

      User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        await firebaseUser.updateDisplayName(fullName);
        await firebaseUser.sendEmailVerification();

        if (emailVerified) {
          // Convert FirebaseUser to User
          model.User user = model.User.fromFirebaseUser(firebaseUser);

          // Save user details to shared preferences using UserCredentials
          model.UserCredentials userCredentials = model.UserCredentials();
          userCredentials.email = user.email;
          userCredentials.uid = user.uid;
          userCredentials.displayName = user.displayName;
          userCredentials.profilePicUrl = user.profilePicUrl;
          await userCredentials.saveToPreferences();
        } else {
          await _auth.signOut();
        }
      }
    } catch (e) {
      throw Exception('Registration failed: $e');
    }
  }

  // To sign out (google account or firebase account)
  Future<void> signOut() async {
    await _auth.signOut();
    await GoogleSignIn().signOut();
  }
}

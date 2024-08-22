import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:shared_preferences/shared_preferences.dart';

class User {
  final String uid;
  final String email;
  final String displayName;
  final String profilePicUrl;

  User({
    required this.uid,
    required this.email,
    required this.displayName,
    required this.profilePicUrl,
  });

  // Method to convert FirebaseUser to User
  factory User.fromFirebaseUser(auth.User firebaseUser) {
    return User(
      uid: firebaseUser.uid,
      email: firebaseUser.email ?? '',
      displayName: firebaseUser.displayName ?? '',
      profilePicUrl: firebaseUser.photoURL ?? '',
    );
  }

  // Method to fetch user data
  Map<String, String?> getUserData() {
    return {
      'email': email,
      'uid': uid,
      'displayName': displayName,
      'profilePicUrl': profilePicUrl,
    };
  }
}

// Singleton class to store user credentials
class UserCredentials {
  // Private constructor
  UserCredentials._privateConstructor();

  // Singleton instance
  static final UserCredentials _instance =
      UserCredentials._privateConstructor();

  // Factory constructor to return the same instance
  factory UserCredentials() {
    return _instance;
  }

  // User email and password
  String? email;
  String? uid;
  String? displayName;
  String? profilePicUrl;

  // Method to fetch user data
  // Save user data to shared preferences
  Future<void> saveToPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email ?? '');
    await prefs.setString('uid', uid ?? '');
    await prefs.setString('displayName', displayName ?? '');
    await prefs.setString('profilePicUrl', profilePicUrl ?? '');
  }

  // Load user data from shared preferences
  Future<void> loadFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email');
    uid = prefs.getString('uid');
    displayName = prefs.getString('displayName');
    profilePicUrl = prefs.getString('profilePicUrl');
  }
}

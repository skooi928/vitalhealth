import 'package:firebase_auth/firebase_auth.dart' as auth;

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

  // Method to convert User to a map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
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
  String? password;
}

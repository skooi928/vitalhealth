import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String email;
  final String displayName;
  final String profilePicUrl;
  final String role;

  User({
    required this.uid,
    required this.email,
    required this.displayName,
    required this.profilePicUrl,
    required this.role,
  });

  // Method to convert Firebase document snapshot to User
  factory User.fromDocumentSnapshot(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return User(
      uid: doc.id,
      email: data['email'],
      displayName: data['displayName'],
      profilePicUrl: data['profilePicUrl'],
      role: data['role'],
    );
  }

  // Method to convert User to a map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'displayName': displayName,
      'profilePicUrl': profilePicUrl,
      'role': role,
    };
  }
}

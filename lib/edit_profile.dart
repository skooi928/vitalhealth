import 'package:flutter/material.dart';
import '/models/user.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  EditProfileState createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  // Fetch ALL user details
  final String? displayName = UserCredentials().displayName;
  final String? profilePicUrl = UserCredentials().profilePicUrl;
  final String? email = UserCredentials().email;
  final String? realName = UserCredentials().realName;
  final String? phoneNumber = UserCredentials().phoneNumber;
  final int? age = UserCredentials().age;
  final String? gender = UserCredentials().gender;
  final double? height = UserCredentials().height;
  final double? weight = UserCredentials().weight;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Rounded Edge Background
          Container(
            margin:
                const EdgeInsets.only(top: 35.0), // Set the top margin to 35
            decoration: const BoxDecoration(
              color: Color.fromARGB(174, 174, 199, 255),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
              ),
            ),
            height: MediaQuery.of(context)
                .size
                .height, // Set height to screen height
            child: Column(
              children: [
                const SizedBox(height: 20.0), // Add spacing from the top
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Adjust spacing between items
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8.0), // Add margin to the left and right
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                            Icons.arrow_back_ios), // Add your first button here
                      ),
                    ),
                  ],
                ),
                // Profile Picture
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Back Button and Profile Picture with Username
                          const Center(
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage(
                                  'assets/images/default_avatar.png'), // Replace with user's real image
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Change Picture',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Personal Details Card
                          Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Personal details",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Health Status, Calendar, Medical History Buttons
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

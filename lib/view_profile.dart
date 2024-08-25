import 'package:flutter/material.dart';
import 'home.dart';
import 'edit_profile.dart';
import 'models/user.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  ViewProfileState createState() => ViewProfileState();
}

class ViewProfileState extends State<ViewProfile> {
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

  bool get isProfileIncomplete {
    return email == null ||
        realName == null ||
        phoneNumber == null ||
        age == null ||
        gender == null ||
        height == null ||
        weight == null;
  }

  bool showAlert = false;

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
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        child: const Icon(
                            Icons.arrow_back_ios), // Add your first button here
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8.0), // Add margin to the left and right
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditProfile(),
                            ),
                          );
                        },
                        child: const Icon(
                            Icons.edit), // Add your second button here
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
                          Center(
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: profilePicUrl != null
                                  ? NetworkImage(profilePicUrl!)
                                  : const AssetImage(
                                          'assets/images/default_avatar.png')
                                      as ImageProvider,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            displayName!, // Replace with user's real username
                            style: const TextStyle(
                              fontSize: 18,
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
                                  _buildDetailRow("Name:", realName ?? "-"),
                                  _buildDetailRow(
                                      "Contact no.:", phoneNumber ?? "-"),
                                  _buildDetailRow("Email:", email ?? "-"),
                                  _buildDetailRow(
                                      "Age:", age?.toString() ?? "-"),
                                  _buildDetailRow("Gender:", gender ?? "-"),
                                  _buildDetailRow("Height:",
                                      height?.toStringAsFixed(2) ?? "-"),
                                  _buildDetailRow("Weight:",
                                      weight?.toStringAsFixed(2) ?? "-"),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Health Status, Calendar, Medical History Buttons
                          _buildOptionCard(
                            icon: Icons.favorite,
                            text: "Health Status",
                            onTap: () {
                              // Handle Health Status tap
                            },
                          ),
                          _buildOptionCard(
                            icon: Icons.calendar_today,
                            text: "Calendar",
                            onTap: () {
                              // Handle Calendar tap
                            },
                          ),
                          _buildOptionCard(
                            icon: Icons.history,
                            text: "Medical History",
                            onTap: () {
                              // Handle Medical History tap
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Floating alert box
          if (isProfileIncomplete)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                    child: Row(
                  children: [
                    const Text(
                      "Please ",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditProfile(),
                          ),
                        );
                      },
                      child: const Text(
                        "complete your profile",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          decoration: TextDecoration.underline, // underline
                          decorationColor: Colors.red, // underline color
                        ),
                      ),
                    ),
                    const Text(
                      " for more features...",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                      ),
                    ),
                  ],
                )),
              ),
            ),
        ],
      ),
    );
  }
}

Widget _buildDetailRow(String title, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      Text(
        value,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    ],
  );
}

Widget _buildOptionCard(
    {required IconData icon,
    required String text,
    required VoidCallback onTap}) {
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      onTap: onTap,
    ),
  );
}

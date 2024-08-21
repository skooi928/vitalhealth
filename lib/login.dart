import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full-screen image
          Positioned.fill(
            child: Image.asset(
              'assets/images/login_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          // Blurred and transparent container with login UI
          Center(
            child: Container(
              width: 300,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.69),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Center(
                    child: Column(
                      children: [
                        Text(
                          'Welcome to',
                          style: TextStyle(
                            fontSize: 24,
                            color: Color(0xFFA4A5FF),
                          ),
                        ),
                        Text(
                          'VitalH3Alth',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFA4A5FF),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                      height:
                          20), // Add this to add space between the text and the text field
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Color(0xFFA4A5FF),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(
                              0xFFA4A5FF), // Set the desired color for the border
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(
                              0xFFA4A5FF), // Set the desired color for the enabled border
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(
                              0xFFA4A5FF), // Set the desired color for the focused border
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Color(0xFFA4A5FF),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(
                              0xFFA4A5FF), // Set the desired color for the border
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(
                              0xFFA4A5FF), // Set the desired color for the enabled border
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(
                              0xFFA4A5FF), // Set the desired color for the focused border
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.5),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Handle login with Google
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors
                                  .white, // Background color of the button
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Image.asset(
                              'assets/images/google_icon.png',
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Handle forgot password
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                                color: Color(0xFF757575), fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle login
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color(0xFFA4A5FF),
                              width: 1), // Add black border
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors
                            .white, // Set the background color to transparent
                        shadowColor:
                            Colors.black.withOpacity(0.1), // Remove the shadow
                      ),
                      child: const Text('Login'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        'New Here? ',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFA4A5FF),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Handle sign up
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFA4A5FF),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

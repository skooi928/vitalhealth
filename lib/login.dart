import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vital_health/firebase_auth/auth_service.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  Future<void> _handleGoogleSignIn() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await _auth.signInWithGoogle();
      // Handle successful login (e.g., navigate to the home page)
      if (!mounted) {
        return;
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } catch (e) {
      // Handle login error
      print(e);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
          // Cross icon at the top right
          Positioned(
            top: 40,
            right: 20,
            child: GestureDetector(
              onTap: () {
                // Handle close action
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const HomePage()), // Remember to change back to not login state
                );
              },
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 30,
              ),
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
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
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
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
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
                            _isLoading
                                ? const CircularProgressIndicator()
                                : _handleGoogleSignIn();
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
                              color: Color(0xFF757575),
                              fontSize: 10,
                              decoration: TextDecoration.underline,
                            ), // Add underline
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () async {
                        String email = _emailController.text;
                        String password = _passwordController.text;
                        // Handle login
                        bool loginSuccess = await _auth.login(email, password);
                        if (loginSuccess) {
                          // Save login status
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setBool('isLoggedIn', true);
                          if (!mounted) {
                            return;
                          }
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        } else {
                          if (!mounted) {
                            return;
                          }
                          // Optionally, show an error message to the user
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Login failed. Please try again.')),
                          );
                        }
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
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Color(0xFFA4A5FF)),
                      ),
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

import 'package:flutter/material.dart';
import 'login.dart'; // Import the LoginPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VitalH3Alth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full-screen image
          Positioned.fill(
            child: Image.asset(
              'assets/images/onboarding_screen.png',
              fit: BoxFit.cover,
            ),
          ),
          // Positioned button
          Positioned(
            bottom: 150, // Adjust this value to position the button vertically
            left: 20, // Adjust this value to position the button horizontally
            right: 20, // Adjust this value to position the button horizontally
            child: Center(
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()), // Navigate to LoginPage
                    );
                  },
                  child: const Text(
                    'Get Started!',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Cracker',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFA4A5FF),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

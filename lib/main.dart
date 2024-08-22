import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'firebase_auth_check.dart';
import 'models/user.dart';

int? isViewed;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Load user credentials from shared preferences
  await UserCredentials().loadFromPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<void> _initializeFirebase() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isViewed = prefs.getInt('onBoard');
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      // Fix only portrait, like IG
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VitalH3Alth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          // Show loading indicator while waiting for Firebase initialization
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            // Handle error
            return Scaffold(
              body: Center(
                child: Text('Error initializing Firebase: ${snapshot.error}'),
              ),
            );
          } else {
            // Firebase initialized successfully, show the main app
            return isViewed != 0
                ? const OnboardingScreen()
                : FirebaseAuthCheck();
          }
        },
      ),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  _storeOnboardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
  }

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
                  onPressed: () async {
                    await _storeOnboardInfo(); // Only show the onboarding screen once
                    if (!mounted) {
                      return;
                    } // Check if the widget is still mounted
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FirebaseAuthCheck()),
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

import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full-screen image
          Positioned.fill(
            child: Image.asset(
              'assets/images/loginRegister_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          // Positioned button
          Positioned(
            top: 40,
            right: 20,
            child: GestureDetector(
              onTap: () {
                // Handle close action
                Navigator.pop(context
                    // Pop back to previous navigate screen
                    // **REMARK: ALL SCREEN NAVIGATE TO REGISTER MUST NOT USE PUSH REPLACEMENT!!!**
                    );
              },
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

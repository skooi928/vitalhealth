import 'package:flutter/material.dart';
import 'package:vital_health/home.dart';

// Main Widget
class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Stack(
        children: [
          // Rounded Edge Background
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(174, 174, 199, 255),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
              ),
            ),
            height: 1000.0, // Adjust the height to your preference
            child: Column(
              children: [
                SizedBox(height: 20.0), // Add spacing from the top
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjust spacing between items
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      child: Icon(Icons.arrow_back_ios), // Add your first button here
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0), // Add some padding to move the text to the right
                        child: Text(
                          'Daily Goals',
                          style: TextStyle(fontSize: 30.0), // Adjust text style as needed
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Icon(Icons.more_vert_rounded), // Add your second button here
                    ),
                  ],
                ),
                SizedBox(height: 20.0), // Add spacing between header and cards
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}     
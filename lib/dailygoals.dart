import 'package:flutter/material.dart';
import 'package:vital_health/home.dart';

// Main Widget
class DailyGoals extends StatelessWidget {
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
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    children: [
                      CustomCard(
                        title: 'Water Intake',
                        description: 'Sufficient water intake',
                        imagePath: 'assets/images/water.jpg',
                        cardColor: const Color.fromARGB(255, 255, 255, 255), // Custom color
                      ),
                      SizedBox(height: 20.0),
                      CustomCard(
                        title: 'Eat 3 Meals',
                        description: 'Eat good food',
                        imagePath: 'assets/images/carrot.jpg',
                        cardColor: Colors.white,
                      ),
                      SizedBox(height: 20.0),
                      CustomCard(
                        title: 'Meditate For 5 MIN',
                        description: 'Calm your mind',
                        imagePath: 'assets/images/meditation.jpg',
                        cardColor: Colors.white,
                      ),
                      SizedBox(height: 20.0),
                      CustomCard(
                        title: 'Evening Skincare',
                        description: 'Always 18 years old',
                        imagePath: 'assets/images/skincare.jpg',
                        cardColor: Colors.white,
                      ),
                      SizedBox(height: 20.0),
                      CustomCard(
                        title: '30 MIN workout',
                        description: 'Keep fit',
                        imagePath: 'assets/images/dumbbell.jpg',
                        cardColor: Colors.white,
                      ),
                      SizedBox(height: 20.0),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () {
                            // Add action for the "Add" button
                          },
                          child: Text('Add'),
                        ),
                      ),
                      SizedBox(height: 20.0),
                    ],
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

// Custom Card Widget
class CustomCard extends StatefulWidget {
  final String title;
  final String description;
  final String imagePath;
  final Color cardColor; // Add color as a parameter

  CustomCard({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.cardColor,
  });

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.cardColor, // Set the custom color
      elevation: 8.0, // Add elevation to create a shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(
              widget.imagePath,
              width: 50.0, // Adjust the width of the image as needed
              height: 50.0, // Adjust the height of the image as needed
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16.0), // Spacing between the image and text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    widget.description,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
            Checkbox(
              value: _isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value ?? false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

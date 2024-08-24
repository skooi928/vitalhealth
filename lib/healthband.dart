import 'package:flutter/material.dart';
import 'package:vital_health/home.dart';

// Main Widget
class Healthband extends StatelessWidget {
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
                          'Health Band',
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
              ],
            ),
          ),
          // ListView of Cards
          Padding(
            padding: const EdgeInsets.only(top: 100.0), // Adjust the top padding to overlap with background
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                CustomCardOne(),
                SizedBox(height: 20.0), // Add spacing between cards
                CustomCardTwo(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Card 1
class CustomCardOne extends StatefulWidget {
  @override
  _CustomCardOneState createState() => _CustomCardOneState();
}

class _CustomCardOneState extends State<CustomCardOne> {
  bool _isConnected = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0), // Add some padding to move the text to the right
                    child: Icon(
                      _isConnected ? Icons.watch : Icons.wifi, // Change icon based on connection status
                      color: const Color.fromRGBO(164,165,255,1.000),
                      size: 50,
                    ),
                  ),
                ),
                SizedBox(width: 10.0), // Spacing between the icon and text
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0), // Add some padding to move the text to the right
                    child: Text(
                      _isConnected
                          ? 'Your band is connected to your phone'
                          : 'Your band isn\'t connected to your phone',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Align(
              alignment: Alignment.centerRight, // Align the button to the right
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isConnected = !_isConnected; // Toggle connection status
                  });
                },
                child: Text(_isConnected ? 'Connected' : 'Connect'), // Change button text based on connection status
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Card 2
class CustomCardTwo extends StatefulWidget {
  @override
  _CustomCardTwoState createState() => _CustomCardTwoState();
}

class _CustomCardTwoState extends State<CustomCardTwo> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Heart Rate',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                SizedBox(width: 30), // Add space to the left of "110"
                Text(
                  '110',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Center(
              child: SizedBox(
                width: 350, // Set the width as needed
                height: 250, // Set the height as needed
                child: Image.asset(
                  'assets/images/heartbeats_graph.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Heart Rate Abnormal Alert',
                        style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 2.0),
                      Text(
                        'User will receive notifications when abnormal heart rate is detected',
                        style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                        softWrap: true, // Wrap text if needed
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8.0),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: Switch(
                    key: ValueKey<bool>(_isSwitched),
                    value: _isSwitched,
                    onChanged: (bool value) {
                      setState(() {
                        _isSwitched = value;
                      });
                    },
                    activeColor: Color.fromRGBO(164,165,255,1.000),
                    hoverColor: Color.fromRGBO(164,165,255,1.000),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

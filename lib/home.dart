import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // This removes the back button
        // Left side
        // Circle Button with Avatar icon (clickable)
        leading: IconButton(
          icon: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar_not_login.png'),
          ),
          onPressed: () {
            // function
            // collapsible sidebar
          },
        ),
        // Center
        // Search bar with placeholder text
        title: const TextField(
          decoration: InputDecoration(
            // Search icon
            prefixIcon: Icon(Icons.search),
            hintText: 'Search Doctor, Medicine, Tests...',
            border: InputBorder.none,
          ),
        ),
      ),
      body: const Center(
        child: Text('Welcome to the Home Page!'),
      ),
    );
  }
}

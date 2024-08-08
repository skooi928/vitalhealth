import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // This removes the back button
        // Bottom border
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: const Color(0xFF757575),
            height: 1.0,
          ),
        ),
        // Padding (top and bottom)
        toolbarHeight: 65.0,
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
        title: Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 15.0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFFFFFFF),
                    isDense: true,
                    // Padding
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 15.0),
                    // Search icon
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 22,
                      color: Color(0xFF757575),
                    ),
                    hintText: 'Search Doctor, Medicine, Tests...',
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF757575),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color(0xFF757575), width: 1),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color(0xFF757575), width: 1),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color(0xFF757575), width: 1),
                      borderRadius: BorderRadius.circular(45),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Welcome to the Home Page!'),
      ),
    );
  }
}

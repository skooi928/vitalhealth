import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Default selected index
  bool _showIndicator = false; // Indicator visibility

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _showIndicator = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: const Color(0xFF757575),
            height: 1.0,
          ),
        ),
        elevation: 0.0,
        toolbarHeight: 66.0,
        titleSpacing: 7.0,
        leading: IconButton(
          icon: !_showIndicator
              ? const CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/avatar_not_login.png'),
                )
              : const Icon(
                  Icons.home,
                  size: 35,
                ),
          onPressed:
              () {}, // also using ?: operator to switch between avatar and home icon
        ),
        title: Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFFFFFFF),
                    isDense: true,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10.0),
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
      bottomNavigationBar: Stack(
        children: [
          if (_showIndicator)
            // Positioned indicator
            Positioned(
              top: 0,
              left: MediaQuery.of(context).size.width /
                  4 *
                  _selectedIndex, // Adjust position based on selected index
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 5,
                decoration: BoxDecoration(
                  color: const Color(0xFFA4A5FF),
                  border: Border.all(
                    color: const Color(0xFFA4A5FF),
                    width: 7,
                  ),
                ),
              ),
            ),
          NavigationBarTheme(
            data: NavigationBarThemeData(
              labelTextStyle: MaterialStateProperty.all(
                const TextStyle(
                  fontSize: 8,
                  height: 1.4,
                ),
              ),
              indicatorColor: Colors.transparent,
            ),
            child: NavigationBar(
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              height: 75,
              destinations: const <NavigationDestination>[
                NavigationDestination(
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.medication),
                      Padding(
                        padding: EdgeInsets.only(top: 2.0),
                        child: Text(
                          'Medication\nManagement',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),
                      ),
                    ],
                  ),
                  label: '',
                ),
                NavigationDestination(
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.receipt),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          'Prescription\nManagement',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),
                      ),
                    ],
                  ),
                  label: '',
                ),
                NavigationDestination(
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.calendar_today),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          'Consultation\nAppointment',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),
                      ),
                    ],
                  ),
                  label: '',
                ),
                NavigationDestination(
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.group),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          'Community\nHub',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),
                      ),
                    ],
                  ),
                  label: '',
                ),
              ],
              onDestinationSelected: _onItemTapped,
              selectedIndex: _selectedIndex,
            ),
          ),
        ],
      ),
    );
  }
}

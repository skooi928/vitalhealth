import 'package:flutter/material.dart';
import 'manage_medicine.dart';
import 'manage_prescription.dart';
import 'community.dart';
import 'consultation.dart';
import 'models/user.dart';
import 'login.dart';
import 'firebase_auth/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Default selected index
  bool _showIndicator = false; // Indicator visibility
  bool _isLoading = false; // Loading indicator visibility
  final AuthService _auth = AuthService();

  static const List<Widget> widgetOptions = <Widget>[
    // Add pages here
    ManageMedicine(),
    ManagePrescription(),
    Consultation(),
    Community(),
  ];

  void _topIconPressed(BuildContext context) {
    if (!_showIndicator) {
      // Collapsible sidebar here
      Scaffold.of(context).openDrawer(); // Open the drawer
    } else {
      setState(() {
        _showIndicator = false;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _showIndicator = true;
    });
  }

  // Signout
  Future<void> _signOut() async {
    _isLoading = true;
    try {
      await _auth.signOut();
      // Clear user preferences except for 'onBoard'
      final prefs = await SharedPreferences.getInstance();
      final keys = prefs.getKeys();
      for (String key in keys) {
        if (key != 'onBoard') {
          await prefs.remove(key);
        }
      }

      // Clear UserCredentials singleton instance
      UserCredentials().email = null;
      UserCredentials().uid = null;
      UserCredentials().displayName = null;
      UserCredentials().profilePicUrl = null;

      // Navigate back to login screen
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Login(),
          ),
        );
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Fetch user details
    String? displayName = UserCredentials().displayName;
    String? profilePicUrl = UserCredentials().profilePicUrl;
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
        leading: Builder(
          builder: (context) => IconButton(
            icon: !_showIndicator
                ? CircleAvatar(
                    backgroundImage: profilePicUrl != null &&
                            profilePicUrl.isNotEmpty
                        ? NetworkImage(profilePicUrl)
                        : const AssetImage('assets/images/default_avatar.png')
                            as ImageProvider,
                  )
                : const Icon(
                    Icons.home,
                    size: 35,
                  ),
            onPressed: () {
              _topIconPressed(
                  context); // also switch between avatar and home icon
            },
          ),
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
      drawer: Drawer(
        child: Container(
          padding: const EdgeInsets.only(top: 25.0),
          decoration: const BoxDecoration(
            color: Color(0xFFDAE2FF),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              // User Profile Section
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: profilePicUrl != null &&
                              profilePicUrl.isNotEmpty
                          ? NetworkImage(profilePicUrl)
                          : const AssetImage(
                                  'assets/images/default_avatar.png') // Just an alternative image, later on will do a homepage
                              // with exactly same design but with this default avatar image
                              as ImageProvider,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      displayName ??
                          'Guest', // The Guest display is also on the another widget called HomePageNotLogin
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'View Profile',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              // Menu Items Section
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.health_and_safety),
                      title: const Text('Health Band'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.message),
                      title: const Text('Message'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.check_circle),
                      title: const Text('Daily Goals'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.report),
                      title: const Text('Health Report'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Setting'),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              // Log Out Section
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Log Out'),
                  onTap: () {
                    // Handle log out
                    _signOut();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          !_showIndicator
              ? const HomePageContent()
              : widgetOptions.elementAt(_selectedIndex),
          if (_isLoading)
            Container(
              color: Colors.white.withOpacity(0.69),
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xFFA4A5FF)), // Change this color as needed
                ),
              ),
            ),
        ],
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
                    width: 7.5,
                  ),
                ),
              ),
            ),
          NavigationBarTheme(
            data: NavigationBarThemeData(
              labelTextStyle: WidgetStateProperty.all(
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
                      Image(
                        image: AssetImage('assets/images/medicine_icon.png'),
                        width: 24,
                        height: 24,
                      ),
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
                      Image(
                        image: AssetImage(
                            'assets/images/managePrescription_icon.png'),
                        width: 24,
                        height: 24,
                      ),
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
                      Image(
                        image:
                            AssetImage('assets/images/consultation_icon.png'),
                        width: 24,
                        height: 24,
                      ),
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
                      Image(
                        image: AssetImage('assets/images/community_icon.png'),
                        width: 24,
                        height: 24,
                      ),
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

class HomePageContent extends StatelessWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Quick Consult Card
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.purple[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "We will assign quick\nand best doctor",
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Quick Consult"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Upcoming Appointment
            const Text(
              "Upcoming Appointment",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/images/doctor.png'), // Replace with actual image asset
                ),
                title: const Text("Dr. Afna Khan"),
                subtitle: const Text("Skin Specialist | Hospital 123"),
                trailing: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    Text("4.9"),
                  ],
                ),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: const Text("Today, 5:00 PM"),
            ),
            const SizedBox(height: 16),
            // Pharmacy Nearby
            const Text(
              "Pharmacy Nearby",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 200, // Set the desired width
                          height: 80, // Set the desired height
                          child: Image.asset(
                            'assets/images/pharmacy1.jpg',
                            fit: BoxFit
                                .cover, // Adjust the image to cover the box while maintaining its aspect ratio
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Pharmacy 456"),
                        ),
                        const Text("1.0 km | 4.8 reviews"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 200, // Set the desired width
                          height: 80, // Set the desired height
                          child: Image.asset(
                            'assets/images/pharmacy2.png',
                            fit: BoxFit
                                .cover, // Adjust the image to cover the box while maintaining its aspect ratio
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Pharmacy XYZ"),
                        ),
                        const Text("500 m | 4.8 reviews"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {},
              child: const Text("See all"),
            ),
          ],
        ),
      ),
    );
  }
}

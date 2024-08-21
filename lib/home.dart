import 'package:flutter/material.dart';
import 'manage_medicine.dart';
import 'manage_prescription.dart';
import 'Community.dart';
import 'consultation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Default selected index
  bool _showIndicator = false; // Indicator visibility

  static List<Widget> widgetOptions = <Widget>[
    // Add pages here
    const ManageMedicine(),
    const ManagePrescription(),
    const Consultation(),
    const Community(),
  ];

  void _topIconPressed() {
    if (!_showIndicator) {
      // Collapsible sidebar here
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
          _topIconPressed, // also switch between avatar and home icon
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
      body: !_showIndicator
          ? const HomePageContent()
          : widgetOptions.elementAt(_selectedIndex),
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

class HomePageContent extends StatelessWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16.0), // Center the card
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Text(
                        'We will assign quick and best doctor',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFA4A5FF), // Updated with color code
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Quick Consult'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Upcoming Appointment',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0), // Adjust margin to increase card size
              child: Padding(
                padding: const EdgeInsets.all(16.0), // Adjust padding to increase card size
                child: Row(
                  children: [
                    Image.asset('assets/images/homepage_drphoto.png', height: 100, width: 100), // Increased image size
                    const SizedBox(width: 20), // Space between image and details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Dr. Afna Khan',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const Text('Skin Specialist | Hospital 123'),
                          const SizedBox(height: 10),
                          const Row(
                            children: [
                              Text('4.9'),
                              Icon(Icons.star, color: Colors.yellow),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Icon(Icons.calendar_today, color: Colors.grey), // Calendar icon
                              const SizedBox(width: 5),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFA4A5FF), // Updated with color code
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text('Today, 5:00 PM'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Pharmacy Nearby',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const PharmacyCard(
              name: 'Pharmacy 456',
              distance: '1.2 km',
              reviews: '24 reviews',
              imagePath: 'assets/images/homepage_pharmacy1.png',
            ),
            const PharmacyCard(
              name: 'Pharmacy XYZ',
              distance: '500 m',
              reviews: '48 reviews',
              imagePath: 'assets/images/homepage_pharmacy2.png',
            ),
          ],
        ),
      ),
    );
  }
}

class PharmacyCard extends StatelessWidget {
  final String name;
  final String distance;
  final String reviews;
  final String imagePath;

  const PharmacyCard({
    super.key,
    required this.name,
    required this.distance,
    required this.reviews,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0), // Adjust margin to increase card size
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Adjust padding to increase card size
        child: ListTile(
          leading: Image.asset(imagePath, height: 100), // Display the image
          title: Text(name),
          subtitle: Text('$distance - $reviews'),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '/models/user.dart';

class ManagePrescription extends StatefulWidget {
  const ManagePrescription({Key? key}) : super(key: key);

  @override
  ManagePrescriptionState createState() => ManagePrescriptionState();
}

class ManagePrescriptionState extends State<ManagePrescription> {
  // Fetch username
  String? displayName = UserCredentials().displayName;

  final GlobalKey _menuKey = GlobalKey();

  void _showPopupMenu() {
    final RenderBox? renderBox =
        _menuKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero);
      final size = renderBox.size;

      showMenu(
        context: context,
        position: RelativeRect.fromLTRB(
          position.dx,
          position.dy + size.height,
          position.dx + size.width,
          position.dy,
        ),
        items: [
          const PopupMenuItem<String>(
            value: 'date',
            child: Text('Date'),
          ),
          const PopupMenuItem<String>(
            value: 'status',
            child: Text('Status'),
          ),
          const PopupMenuItem<String>(
            value: 'id',
            child: Text('ID'),
          ),
          const PopupMenuItem<String>(
            value: 'no_of_medicines',
            child: Text('No of Medicines'),
          ),
        ],
      ).then((value) {
        if (value != null) {
          // Handle the selected value
          print('Selected: $value');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Filter Button Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  '$displayName\'s Prescriptions Purchase Records',
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton.icon(
                key: _menuKey,
                onPressed: () {
                  // Call dropdown menu
                  _showPopupMenu();
                },
                icon: const Icon(Icons.filter_alt_rounded),
                label: const Text('Filter'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFA4A5FF),
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),

          // List of Prescription Records
          Expanded(
            child: ListView(
              children: [
                _buildPrescriptionCard(
                  context,
                  backgroundColor: Colors.red[100],
                  statusColor: const Color(0xFFB22222),
                  statusText: "Incomplete",
                  prescriptionNumber: "#WE123121",
                  date: "30-April-2024",
                  doctorName: "Dr. Jane Smith",
                  hospital: "Hospital Lam Wah Ee",
                  licenseNumber: "123456",
                  contact: "011-2134 9824",
                  totalTypes: 2,
                ),
                _buildPrescriptionCard(
                  context,
                  backgroundColor: Colors.yellow[100],
                  statusColor: const Color(0xFFFFA500),
                  statusText: "Ongoing",
                  prescriptionNumber: "#IH232211",
                  date: "28-March-2024",
                  doctorName: "Dr. Lebron James",
                  hospital: "Island Hospital",
                  licenseNumber: "654321",
                  contact: "011-792 3699",
                  totalTypes: 2,
                ),
                _buildPrescriptionCard(
                  context,
                  backgroundColor: Colors.green[100],
                  statusColor: const Color(0xFF247B7B),
                  statusText: "Completed",
                  prescriptionNumber: "#IH241432",
                  date: "10-January-2024",
                  doctorName: "Dr. Lebron James",
                  hospital: "Island Hospital",
                  licenseNumber: "654321",
                  contact: "011-792 3699",
                  totalTypes: 3,
                ),
              ],
            ),
          ),

          // No More Results Message
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                "-- No more results --",
                style: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrescriptionCard(
    BuildContext context, {
    Color? backgroundColor,
    Color? statusColor,
    required String statusText,
    required String prescriptionNumber,
    required String date,
    required String doctorName,
    required String hospital,
    required String licenseNumber,
    required String contact,
    required int totalTypes,
  }) {
    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Prescription Number and Date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  prescriptionNumber,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),

            // Doctor Information
            Text(
              "$doctorName, MD ($hospital)",
              style: const TextStyle(fontSize: 14.0),
            ),
            Text(
              "Medical License No.: $licenseNumber",
              style: const TextStyle(fontSize: 14.0),
            ),
            Text(
              "Contact: $contact",
              style: const TextStyle(fontSize: 14.0),
            ),
            const SizedBox(height: 8.0),

            // Total Types of Medicines and Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total types of medicines: $totalTypes",
                  style: const TextStyle(fontSize: 14.0),
                ),
                Text(
                  statusText,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: statusColor, // Adjust this color as needed
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

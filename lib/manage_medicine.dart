import 'package:flutter/material.dart';

class ManageMedicine extends StatelessWidget {
  const ManageMedicine({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6E9FF), // Light blue background
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Progress Indicator
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.autorenew,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Ongoing",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            const CircularProgressIndicator(
                              value: 0.5, // This represents the 50% progress
                              strokeWidth: 10,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFF757575),
                              ),
                              backgroundColor: Color(0xFF247B7B),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '50%',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Calendar Section
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "August 2024",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Days Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(7, (index) {
                        final dayOfWeek = [
                          'Sat',
                          'Sun',
                          'Mon',
                          'Tue',
                          'Wed',
                          'Thu',
                          'Fri'
                        ][index];
                        return Column(
                          children: [
                            Text(
                              dayOfWeek,
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 5),
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: index == 5
                                  ? const Color(0xFF247B7B)
                                  : Colors.transparent,
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                  color:
                                      index == 5 ? Colors.white : Colors.black,
                                  fontWeight: index == 5
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                    const SizedBox(height: 20),
                    // Medication List
                    Expanded(
                      child: ListView(
                        children: [
                          _buildMedicationTimeSlot(
                            "9:00 AM",
                            ["Amoxicillin", "Metformin"],
                          ),
                          _buildMedicationTimeSlot(
                            "5:00 PM",
                            ["Amoxicillin", "Metformin"],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicationTimeSlot(String time, List<String> medications) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            time,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          ...medications.map((medication) {
            return Card(
              color: const Color(
                  0xFFE6E9FF), // Light blue background for medication card
              child: ListTile(
                title: Text(
                  medication,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  "Take 1 capsule orally (Before or after food)",
                  style: TextStyle(color: Colors.grey[600]),
                ),
                trailing: const Icon(
                  Icons.radio_button_unchecked,
                  color: Color(0xFF247B7B), // Dark green for the radio button
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}

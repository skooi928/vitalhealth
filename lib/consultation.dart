import 'package:flutter/material.dart';

class Consultation extends StatefulWidget {
  const Consultation({Key? key}) : super(key: key);

  @override
  ConsultationState createState() => ConsultationState();
}

class ConsultationState extends State<Consultation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor image section
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFE8F0FF),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/doctorconsultation1.jpg', // replace with actual image path
                    height: 100,
                    width: 200,
                  ),
                  const Spacer(),
                  const Text(
                    'Find a doctor',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Buttons: Saved, Manage Appointment, Message
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIconButton(
                  icon: Icons.bookmark,
                  label: 'Saved',
                  color: Colors.orange,
                ),
                _buildIconButton(
                  icon: Icons.calendar_today,
                  label: 'Manage Appointment',
                  color: Colors.blue,
                ),
                _buildIconButton(
                  icon: Icons.message,
                  label: 'Message',
                  color: Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Doctor cards
            _buildDoctorCard(
              imageUrl: "assets/images/doctorconsultation2.jpg",
              name: 'Dr. Bonebrake',
              specialty: 'Cardiologist',
              experience: '8 Years experience',
              rating: '95%',
              patientStories: '82 Patient Stories',
              nextAvailable: '12:00 AM tomorrow',
              isFavorite: true,
            ),
            const SizedBox(height: 10),
            _buildDoctorCard(
              imageUrl: "assets/images/doctorconsultation3.jpg",
              name: 'Dr. Tranquilli',
              specialty: 'Specialist medicine',
              experience: '6 Years experience',
              rating: '87%',
              patientStories: '60 Patient Stories',
              nextAvailable: '10:00 AM tomorrow',
              isFavorite: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color, size: 30),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.black)),
      ],
    );
  }

  Widget _buildDoctorCard({
    required String name,
    required String specialty,
    required String experience,
    required String rating,
    required String patientStories,
    required String nextAvailable,
    required String imageUrl,
    required bool isFavorite,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imageUrl),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    specialty,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Text(
                    experience,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow[700], size: 16),
                      const SizedBox(width: 4),
                      Text(rating),
                      const SizedBox(width: 8),
                      Text(patientStories),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Next Available: $nextAvailable',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ManagePrescription extends StatefulWidget {
  const ManagePrescription({Key? key}) : super(key: key);

  @override
  ManagePrescriptionState createState() => ManagePrescriptionState();
}

class ManagePrescriptionState extends State<ManagePrescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Manage Prescription'),
      ),
      body: const Center(
        child: Text('Manage Prescription'),
      ),
    );
  }
}

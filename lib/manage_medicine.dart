import 'package:flutter/material.dart';

class ManageMedicine extends StatefulWidget {
  const ManageMedicine({Key? key}) : super(key: key);

  @override
  ManageMedicineState createState() => ManageMedicineState();
}

class ManageMedicineState extends State<ManageMedicine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Medicine'),
      ),
      body: const Center(
        child: Text('Manage Medicine'),
      ),
    );
  }
}

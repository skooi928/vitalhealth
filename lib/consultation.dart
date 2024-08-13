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
      appBar: AppBar(
        title: const Text('Consultation'),
      ),
      body: const Center(
        child: Text('Consultation'),
      ),
    );
  }
}

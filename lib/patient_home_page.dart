import 'package:flutter/material.dart';

class PatientHomePage extends StatelessWidget {
  const PatientHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Patient Home")),
      body: const Center(
        child: Text(
          "Welcome Patient 🩺",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
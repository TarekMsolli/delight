import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 230, 140, 67),
        ),
        title: const Text('About Us'),
      ),
      body: const Center(
        child: Text('Information and Settings Will Be Displayed Here!'),
      ),
    );
  }
}

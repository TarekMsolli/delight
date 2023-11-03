import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('About Us'),
        ),
      ),
      body: const Center(
        child: Text('Information and Settings Will Be Displayed Here!'),
      ),
    );
  }
}

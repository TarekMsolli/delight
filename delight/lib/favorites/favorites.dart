import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromARGB(
              255, 230, 140, 67), // Change the color of the back arrow here
        ),
        title: const Text('Your Favorites'),
      ),
      body: const Center(
        child: Text('Your Favorite Recipes Will Appear Here!'),
      ),
    );
  }
}

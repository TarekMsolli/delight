import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Your Favorites'),
        ),
      ),
      body: const Center(
        child: Text('Your Favorite Recipes Will Appear Here!'),
      ),
    );
  }
}

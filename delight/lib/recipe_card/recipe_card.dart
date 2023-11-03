import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final Map<String, dynamic> recipeData;

  const RecipeCard({super.key, required this.recipeData});

  @override
  Widget build(BuildContext context) {
    final String recipeName = recipeData['strMeal'] ?? 'No Recipe Name';
    final String imageUrl = recipeData['strMealThumb'] ?? '';
    final String strCategory =
        recipeData['strCategory'] ?? 'No Recipe Category';
    final String strArea = recipeData['strArea'] ?? 'No Area';

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: FadeInImage.assetNetwork(
                placeholder:
                    '../../assets/placeholder.png', // Replace with your placeholder image asset
                image: imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Recipe name
          Positioned(
            top: 120,
            left: 0,
            right: 0,
            child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipeName,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                    Text(strCategory),
                    Text(strArea),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

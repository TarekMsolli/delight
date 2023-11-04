import 'package:flutter/material.dart';

class RecipeInfo extends StatelessWidget {
  final Map<String, dynamic> recipeData;

  const RecipeInfo({Key? key, required this.recipeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String recipeName = recipeData['strMeal'] ?? 'No Recipe Name';
    final String imageUrl = recipeData['strMealThumb'] ?? '';
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(recipeName),
        ),
      ),
      body: Text(
        recipeData.toString(),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RecipeInfo extends StatelessWidget {
  final Map<String, dynamic> recipeData;

  const RecipeInfo({Key? key, required this.recipeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String recipeName = recipeData['strMeal'] ?? 'No Recipe Name';
    final String imageUrl = recipeData['strMealThumb'] ?? '';
    final String strInstructions = recipeData['strInstructions'] ?? '';
    final String idMeal = recipeData['idMeal'] ?? '';

    List<String> ingredients = [];
    for (int i = 1; i <= 9; i++) {
      String ingredientKey = 'strIngredient$i';
      String measureKey = 'strMeasure$i';
      String ingredient = recipeData[ingredientKey];
      String measure = recipeData[measureKey];
      if (ingredient.isNotEmpty) {
        ingredients.add('$ingredient: $measure');
      }
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: const Color.fromARGB(255, 255, 228, 211),
        title: Text(
          recipeName,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: '${recipeData['idMeal']}_$imageUrl',
              child: Container(
                height: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\n$idMeal - $recipeName',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "\n\nInstructions",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 230, 140, 67),
                    ),
                  ),
                  Text(
                    '\n$strInstructions',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "\n\nIngredients\n",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 230, 140, 67),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: ingredients
                        .map((ingredient) => Text(
                              ingredient,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

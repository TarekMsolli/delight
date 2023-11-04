import 'package:flutter/material.dart';

class RecipeInfo extends StatelessWidget {
  final Map<String, dynamic> recipeData;

  const RecipeInfo({Key? key, required this.recipeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String recipeName = recipeData['strMeal'] ?? 'No Recipe Name';
    final String imageUrl = recipeData['strMealThumb'] ?? '';
    final String strInstructions = recipeData['strInstructions'] ?? '';
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 230, 140, 67),
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
              tag: imageUrl,
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
                children: [
                  Text(
                    '\n$recipeName',
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

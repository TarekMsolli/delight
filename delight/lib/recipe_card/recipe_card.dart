import 'package:flutter/material.dart';

String truncateStringToMaxLength(String input, int maxLength) {
  if (input.length <= maxLength) {
    return input;
  }

  List<String> words = input.split(' ');
  String truncatedString = '';

  for (String word in words) {
    if ((truncatedString + word).length + 1 <= maxLength) {
      if (truncatedString.isNotEmpty) {
        truncatedString += ' ';
      }
      truncatedString += word;
    } else {
      break;
    }
  }

  return '$truncatedString...';
}

class RecipeCard extends StatelessWidget {
  final Map<String, dynamic> recipeData;

  const RecipeCard({Key? key, required this.recipeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String recipeName = recipeData['strMeal'] ?? 'No Recipe Name';
    recipeName = truncateStringToMaxLength(recipeName, 20);
    final String imageUrl = recipeData['strMealThumb'] ?? '';
    final String strCategory =
        recipeData['strCategory'] ?? 'No Recipe Category';
    final String strArea = recipeData['strArea'] ?? 'No Area';

    return Card(
      elevation: 14,
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
              height: 120.0,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                child: Hero(
                  tag: '${recipeData['idMeal']}_$imageUrl',
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/placeholder.png',
                    image: imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
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
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: (MediaQuery.of(context).size.width > 340)
                          ? (MediaQuery.of(context).size.width / 30)
                          : (MediaQuery.of(context).size.width / 10),
                    ),
                  ),
                  Text(
                    '$strCategory - $strArea',
                    style: TextStyle(
                      fontSize: (MediaQuery.of(context).size.width > 340)
                          ? (MediaQuery.of(context).size.width / 40)
                          : (MediaQuery.of(context).size.width / 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:delight/recipe_card/recipe_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> recipeDataList = [];

  @override
  void initState() {
    super.initState();
    fetchRandomRecipes(4); // Fetch 6 random recipes
  }

  Future<void> fetchRandomRecipes(int count) async {
    for (int i = 0; i < count; i++) {
      final response = await http
          .get(Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php'));

      if (response.statusCode == 200) {
        setState(() {
          recipeDataList.add(json.decode(response.body)['meals'][0]);
        });
      } else {
        print('Failed to load data from the API');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Home',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins'),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 228, 211),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: recipeDataList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                      top: 16.0), // Adjust the top margin as needed
                  child: RecipeCard(
                    recipeData: recipeDataList[index],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

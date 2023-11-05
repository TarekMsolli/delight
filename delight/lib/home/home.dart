import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:delight/recipe_card/recipe_card.dart';
import 'package:delight/recipeinfo/recipeinfo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> recipeDataList = [];
  int loadedRecipeCount = 0;
  final ScrollController _scrollController = ScrollController();
  bool _isVisible = false;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    fetchRandomRecipes(8);
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      fetchRandomRecipes(4);
    }
    if (_scrollController.offset > 100) {
      setState(() {
        _isVisible = true;
      });
    } else {
      setState(() {
        _isVisible = false;
      });
    }
  }

  Future<void> fetchRandomRecipes(int count) async {
    for (int i = 0; i < count; i++) {
      final response = await http
          .get(Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php'));

      if (response.statusCode == 200) {
        setState(() {
          recipeDataList.add(json.decode(response.body)['meals'][0]);
          loadedRecipeCount++;
        });
      }
      // else {
      //   print('Failed to load data from the API');
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Text("test"),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Home',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins'),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 245, 207, 163),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              controller: _scrollController,
              padding: const EdgeInsetsDirectional.only(
                start: 5,
                end: 5,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: loadedRecipeCount,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(top: 16.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RecipeInfo(recipeData: recipeDataList[index]),
                        ),
                      );
                    },
                    child: RecipeCard(
                      recipeData: recipeDataList[index],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: Opacity(
        opacity: _isVisible ? 1.0 : 0.0,
        child: AnimatedSwitcher(
          //TODO fix floating button animation snapping instead of fading out
          duration: const Duration(milliseconds: 500),
          child: _isVisible
              ? FloatingActionButton(
                  elevation: 14,
                  onPressed: () {
                    _scrollController.animateTo(0,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut);
                  },
                  backgroundColor: const Color.fromARGB(255, 230, 140, 67),
                  child: const Icon(Icons.move_up),
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}

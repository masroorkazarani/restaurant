import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/Data/data.dart';
import 'package:restaurant/provider.dart';

class ListData extends StatelessWidget {
  String m_id;
  ListData({super.key, required this.m_id});

  @override
  Widget build(BuildContext context) {
    final selectedMeal = meals.firstWhere((meal) => meal.id == m_id);
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          selectedMeal.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Consumer<FavoriteList>(
                        builder: (context, favoriteList, child) {
                          return GestureDetector(
                            onTap: () {
                              favoriteList.toggleFavorite(selectedMeal);
                            },
                            child: Icon(
                              favoriteList.isFavorite(selectedMeal)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.black,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.orange,
                        child: Text(
                          'm${meals.indexOf(selectedMeal) + 1}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        selectedMeal.affordability,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      Spacer(),
                      Text(
                        selectedMeal.complexity,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Duration ${selectedMeal.duration} Minutes',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Ingredients',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: selectedMeal.ingredients.length,
                      itemBuilder: (ctx, index) => Container(
                        margin: EdgeInsets.only(right: 8),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                            child: Text(selectedMeal.ingredients[index])),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Steps to prepare',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(height: 8),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: selectedMeal.steps.length,
                    itemBuilder: (ctx, index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${index + 1}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              selectedMeal.steps[index],
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
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

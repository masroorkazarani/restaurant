import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/Models/meals_model.dart';
import 'package:restaurant/listdata.dart';
import 'package:restaurant/provider.dart';

Widget buildCard(BuildContext context, List<Meal> categoryMeals, int index) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ListData(
                  m_id: categoryMeals[index].id,
                )),
      );
    },
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), border: Border.all()),
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    categoryMeals[index].title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 2),
                Consumer<FavoriteList>(
                  builder: (context, favoriteList, child) {
                    return GestureDetector(
                      onTap: () {
                        favoriteList.toggleFavorite(categoryMeals[index]);
                      },
                      child: Icon(
                        favoriteList.isFavorite(categoryMeals[index])
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.black,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
              child: Image.network(
                categoryMeals[index].imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

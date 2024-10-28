import 'package:flutter/material.dart';
import 'package:restaurant/Models/meals_model.dart';

class FavoriteList extends ChangeNotifier{
   List<Meal> favorites = [];

   void toggleFavorite(Meal meal) {
    final isExisting = favorites.contains(meal);
    if (isExisting) {
      favorites.remove(meal);
    } else {
      favorites.add(meal);
    }
    notifyListeners();
  }

  bool isFavorite(Meal meal) {
    return favorites.contains(meal);
  }
}

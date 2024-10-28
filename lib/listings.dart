import 'package:flutter/material.dart';
import 'package:restaurant/Data/data.dart';
import 'package:restaurant/Models/meals_model.dart';
import 'package:restaurant/card_widget.dart';
import 'package:restaurant/listdata.dart';

class Listings extends StatelessWidget {
  String cid;
  String name;
  Listings({super.key, required this.cid, required this.name});

  @override
  Widget build(BuildContext context) {
    final categoryMeals = meals.where((meal) {
      return meal.categoryIds.contains(cid);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
          return buildCard(context, categoryMeals, index);
        },
      ),
    );
  }
}

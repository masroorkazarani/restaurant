import 'package:flutter/material.dart';
import 'package:restaurant/Data/data.dart';
import 'package:restaurant/Models/categories_model.dart';
import 'package:restaurant/favorites.dart';
import 'package:restaurant/listings.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text(
          'Test App',
          style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Favorites()),
                );
              },
              child: Icon(
                Icons.favorite,
                color: Colors.redAccent,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Listings(
                                cid: categories[index].id,
                                name: categories[index].name)),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Color(categories[index].color)),
                      child: Center(
                        child: Text(
                          categories[index].name,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

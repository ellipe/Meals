import 'package:Meals/models/meal.dart';
import 'package:Meals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> _favoritesMeals;

  FavoritesScreen(this._favoritesMeals);

  @override
  Widget build(BuildContext context) {
    if (_favoritesMeals.isEmpty) {
      return Center(
        child: Text(
          'You have no favorites yet - start adding some!',
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: _favoritesMeals[index].id,
            title: _favoritesMeals[index].title,
            imageUrl: _favoritesMeals[index].imageUrl,
            affordability: _favoritesMeals[index].affordability,
            duration: _favoritesMeals[index].duration,
            complexity: _favoritesMeals[index].complexity,
          );
        },
        itemCount: _favoritesMeals.length,
      );
    }
  }
}

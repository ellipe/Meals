import 'package:Meals/models/meal.dart';
import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  final List<Meal> _availableMeals;

  MealsScreen(this._availableMeals);

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArg['title'];
    final categoryId = routeArg['id'];
    final categoryMeals = _availableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            affordability: categoryMeals[index].affordability,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}

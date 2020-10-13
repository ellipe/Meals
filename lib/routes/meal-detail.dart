import 'package:Meals/seeds/dummy_data.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  Widget buildSectionTitle(BuildContext ctx, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(ctx).textTheme.headline6,
      ),
    );
  }

  Widget buildContainerWidget(Widget child) {
    return Container(
      height: 200,
      width: 400,
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey,
          )),
      child: child,
    );
  }

  Widget buildChips(BuildContext context, List<String> chips) {
    return Wrap(
      children: chips
          .map((chip) => Container(
                margin: EdgeInsets.only(
                  left: 5,
                ),
                child: Chip(
                  backgroundColor: Theme.of(context).primaryColor,
                  elevation: 4,
                  label: Text(
                    chip,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/cooking.gif',
                image: selectedMeal.imageUrl,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildChips(context, selectedMeal.ingredients),
            buildSectionTitle(context, 'Steps'),
            buildContainerWidget(
              ListView.builder(
                itemBuilder: (ctx, idx) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${idx + 1}'),
                        ),
                        title: Text(
                          selectedMeal.steps[idx],
                        ),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

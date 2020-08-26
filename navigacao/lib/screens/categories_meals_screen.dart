import 'package:flutter/material.dart';
import 'package:navigacao/components/meal_item.dart';
import 'package:navigacao/data/dummy_data.dart';
import 'package:navigacao/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;

    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(category?.id ?? null);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category?.title ?? ""),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
          final meal = categoryMeals[index];
          return MealItem(meal: meal);
        },
      ),
    );
  }
}

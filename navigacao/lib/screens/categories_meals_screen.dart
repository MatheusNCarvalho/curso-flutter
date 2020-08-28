import 'package:flutter/material.dart';
import 'package:navigacao/components/meal_item.dart';
import 'package:navigacao/models/category.dart';
import 'package:navigacao/models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {

  final List<Meal> meals;

  const CategoriesMealsScreen(this.meals);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;

    final categoryMeals = meals.where((meal) {
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

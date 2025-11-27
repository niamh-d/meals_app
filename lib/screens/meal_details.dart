import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.mealDetails});

  final Meal mealDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(mealDetails.title)),
      body: Image.network(
        mealDetails.imageUrl,
        height: 300,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}

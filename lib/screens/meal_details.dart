import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_details_section.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    super.key,
    required this.mealDetails,
    required this.onToggleFavorite,
  });

  final Meal mealDetails;
  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mealDetails.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.star),
            onPressed: () {
              onToggleFavorite(mealDetails);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              mealDetails.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 14),
            MealDetailsSection(
              sectionTitle: 'Ingredients',
              list: mealDetails.ingredients,
            ),
            const SizedBox(height: 24),
            MealDetailsSection(sectionTitle: 'Steps', list: mealDetails.steps),
          ],
        ),
      ),
    );
  }
}

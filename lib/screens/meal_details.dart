import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favourites_provider.dart';
import 'package:meals_app/widgets/meal_details_section.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({super.key, required this.mealDetails});

  final Meal mealDetails;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favouritesProvider);
    final isFavorite = favoriteMeals.contains(mealDetails);

    return Scaffold(
      appBar: AppBar(
        title: Text(mealDetails.title),
        actions: [
          IconButton(
            icon: Icon(isFavorite ? Icons.star : Icons.star_border),
            onPressed: () {
              final wasAdded = ref
                  .read(favouritesProvider.notifier)
                  .toggleMealFavoriteStatus(mealDetails);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '${mealDetails.title} ${wasAdded ? 'added to' : 'removed from'} favorites',
                  ),
                ),
              );
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

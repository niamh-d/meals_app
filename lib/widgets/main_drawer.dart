import 'package:flutter/material.dart';
import 'package:meals_app/widgets/drawer_tile.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(
                    context,
                  ).colorScheme.primaryContainer.withValues(alpha: 0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              color: Colors.blue,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.food_bank,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 18),
                Text(
                  'Cooking Up!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          DrawerTile(
            title: 'Meals',
            onTap: onSelectScreen,
            icon: Icons.restaurant,
            identifier: 'meals',
          ),
          DrawerTile(
            title: 'Filters',
            onTap: onSelectScreen,
            icon: Icons.settings,
            identifier: 'filters',
          ),
        ],
      ),
    );
  }
}

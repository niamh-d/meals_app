import 'package:flutter/material.dart';

class MealDetailsSection extends StatelessWidget {
  const MealDetailsSection({
    super.key,
    required this.sectionTitle,
    required this.list,
  });

  final String sectionTitle;
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          sectionTitle,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 14),
        for (final item in list)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Text(
              textAlign: TextAlign.center,
              item,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
      ],
    );
  }
}

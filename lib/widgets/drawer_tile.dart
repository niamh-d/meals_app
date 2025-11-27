import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon,
    required this.identifier,
  });

  final String title;
  final IconData icon;
  final void Function(String identifier) onTap;
  final String identifier;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: 24,
        ),
      ),
      onTap: () {
        onTap(identifier);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meals_app/widgets/filter_switch_list_tile.dart';

enum Filter { glutenFree, lactoseFree, vegan, vegetarian }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _veganFilterSet = false;
  var _vegetarianFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
        },
        child: Column(
          children: [
            FilterSwitchListTile(
              title: 'Gluten-free',
              subtitle: 'Only include gluten-free meals',
              value: _glutenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
              },
            ),
            FilterSwitchListTile(
              title: 'Lactose-free',
              subtitle: 'Only include lactose-free meals',
              value: _lactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              },
            ),
            FilterSwitchListTile(
              title: 'Vegan',
              subtitle: 'Only include vegan meals',
              value: _veganFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _veganFilterSet = isChecked;
                });
              },
            ),
            FilterSwitchListTile(
              title: 'Vegetarian',
              subtitle: 'Only include vegetarian meals',
              value: _vegetarianFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFilterSet = isChecked;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

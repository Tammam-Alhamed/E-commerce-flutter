import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_filter_dialog/flutter_filter_dialog.dart';
import 'package:get/get.dart';
import 'package:get'
    '/get_core/src/get_main.dart';

import '../../controller/items_controller.dart';

class MyCustomDrawer extends StatelessWidget {

  ItemsControllerImp controller = Get.put(ItemsControllerImp() , permanent: true);

  @override
  Widget build(BuildContext context) {
    List<List<String>> options  = [
      [ "Red", "Blue", "Green"],
      [ "Nike", "Adidas", "Puma"],

    ];
    List<String> sectionTitles = ["Colors", "Brands", "Price"];

    return  Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.

      child:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section for Colors
            Text(
              "Colors",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Obx(() {
              return Wrap(
                spacing: 8.0,
                children: options[0].asMap().entries.map((entry) {
                  int index = entry.key;
                  String option = entry.value;

                  bool isSelected = controller.selList[0].contains(index);

                  return FilterChip(
                    label: Text(option),
                    selectedColor: Colors.red, // Color for selected items
                    showCheckmark: true,
                    selected: isSelected,
                    onSelected: (selected) {
                      controller.select(0, index); // Update selection
                    },
                  );
                }).toList(),
              );
            }),

            const SizedBox(height: 20),

            // Section for Brands
            Text(
              "Brands",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Obx(() {
              return Wrap(
                spacing: 8.0,
                children: options[1].asMap().entries.map((entry) {
                  int index = entry.key;
                  String option = entry.value;

                  bool isSelected = controller.selList[1].contains(index);

                  return FilterChip(
                    label: Text(option),
                    selectedColor: Colors.red, // Color for selected items
                    showCheckmark: true,
                    selected: isSelected,
                    onSelected: (selected) {
                      controller.select(1, index); // Update selection
                    },
                  );
                }).toList(),
              );
            }),

            const SizedBox(height: 20),

            // Section for Price Input
            Text(
              "Price",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Min Price',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        controller.setMinPrice(value);
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Max Price',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        controller.setMaxPrice(value);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Obx(() {
              return Text(
                'Selected Price Range: ${controller.minPrice} - ${controller.maxPrice}',
                style: const TextStyle(fontSize: 16),
              );
            }),
            const Spacer(),

            // Buttons for Cancel and Confirm
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(

                    onPressed: () {
                      controller.resetFilters(); // Reset filters
                      Get.back(); // Exit the page
                    },
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle confirmation, e.g., apply filters
                      Get.snackbar('Filters Applied',
                          'Your filters have been successfully applied.');
                    },
                    child: const Text('Confirm'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }


}


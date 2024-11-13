import 'package:flutter/material.dart';

class CustomSearchWidget extends StatelessWidget {
  final TextEditingController searchController;
  final String label;
  const CustomSearchWidget(
      {super.key, required this.searchController, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

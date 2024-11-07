import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  // Example filter options
  List<String> genders = ['Male', 'Female', 'Others'];
  List<String> locations = ['HTML/CSS', 'Kotlin', 'PHP/SQL', 'Python'];
  List<String> types = ['UI/UX Designer', 'Web Developer', 'App Developer'];

  String selectedGender = '';
  String selectedLocation = '';
  String selectedType = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
        actions: [
          TextButton(
            onPressed: () {
              // Implement logic to clear filters
              setState(() {
                selectedGender = '';
                selectedLocation = '';
                selectedType = '';
              });
            },
            child: const Text('Clear Filter'),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildFilterDropdown('Gender', genders, selectedGender, (value) {
              setState(() {
                selectedGender = value!;
              });
            }),

            buildFilterDropdown('Location', locations, selectedLocation,
                (value) {
              setState(() {
                selectedLocation = value!;
              });
            }),

            buildFilterDropdown('Type', types, selectedType, (value) {
              setState(() {
                selectedType = value!;
              });
            }),

            // Add more filter options as needed

            const SizedBox(height: 16),

            // Apply Button
            ElevatedButton(
              onPressed: () {
                // Implement logic to apply filters
                print('Applied Filters:');
                print('Gender: $selectedGender');
                print('Location: $selectedLocation');
                print('Type: $selectedType');
                // Add more filters as needed
              },
              child: const Text('Apply'),
            ),
          ],
        ),
      ),

    );
  }

  Widget buildFilterDropdown(
    String title,
    List<String> options,
    String selectedOption,
    void Function(String?) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        DropdownButton<String>(
          value: selectedOption.isNotEmpty ? selectedOption : null,
          onChanged: onChanged,
          items: [
            DropdownMenuItem<String>(
              value: '',
              child: Text('Select $title'),
            ),
            ...options.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intershipapp/loadingpage.dart';

class FilterScreenPage extends StatefulWidget {
  const FilterScreenPage({Key? key}) : super(key: key);

  @override
  State<FilterScreenPage> createState() => _FilterScreenPageState();
}

class _FilterScreenPageState extends State<FilterScreenPage> {
  List<String> genders = ['Male', 'Female', 'Others'];
  List<String> locations = ['HTML/CSS', 'Kotlin', 'PHP/SQL', 'Python'];
  List<String> types = ['UI/UX Designer', 'Web Developer', 'App Developer'];

  String selectedGender = '';
  String selectedLocation = '';
  String selectedType = '';
  String selectedNavigationOption = '';

  // Additional checkbox options for different sections
  Map<String, List<String>> checkboxOptions = {
    'Salary': ['High', 'Medium', 'Low'],
    'Working hours': ['Full-time', 'Part-time'],
    'Field of Work': ['Art&Design', 'Meta'],
    'Country': ['USA', 'India', 'Canada'],
    'Skills': ['UI/UX Design', 'Web\nDevelopment', 'Mobile App\n Development'],
    'Experience': ['1 year', '2 years', '3+ years'],
    'Type': ['High', 'Medium', 'Low'],
    'Location': ['High', 'Medium', 'Low'],
    'Coampany': ['High', 'Medium', 'Low'],
    'Gender': ['High', 'Medium', 'Low'],
  };

  // Selected options for additional sections
  Map<String, String> selectedOptions = {
    'Salary': '',
    'Working hours': '',
    'Field of Work': '',
    'Country': '',
    'Skills': '',
    'Experience': '',
    'Type': '',
    'Location': '',
    'Coampany': '',
    'Gender': '',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            child: Row(children: [
          Image.asset(
            'assets/cross.png',
            scale: 1.0,
            // width: 130.0,
          ),
          const Text(
            '   Filter',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontFamily: 'Mulish',
              fontWeight: FontWeight.w700,
            ),
          )
        ])),
        actions: [
          TextButton(
              onPressed: () {
                // Implement logic to clear filters
                setState(() {
                  selectedGender = '';
                  selectedLocation = '';
                  // selectedType = '';

                  selectedOptions.forEach((key, value) {
                    selectedOptions[key] = '';
                  });
                });
              },
              child: const Text(
                'Clear Filter',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF246BFD),
                  fontSize: 16,
                  fontFamily: 'Mulish',
                  fontWeight: FontWeight.w600,
                ),
              )),
        ],
      ),
      body: Row(
        children: [
          // Left Side: Navigation Options
          Container(
            width: MediaQuery.of(context).size.width / 2.3,
            padding: const EdgeInsets.all(16),
            color: const Color.fromARGB(
                255, 243, 229, 245), // Change the color as needed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildNavigationOption('Salary'),
                buildNavigationOption('Working hours'),
                buildNavigationOption('Field of Work'),
                buildNavigationOption('Country'),
                buildNavigationOption('Skills'),
                buildNavigationOption('Experience'),
              ],
            ),
          ),

          // Right Side: Dynamic Checkboxes
          Container(
            width: MediaQuery.of(context).size.width / 2,
            padding: const EdgeInsets.all(16),
            // color: Colors.blue, // Change the color as needed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Dynamic Checkboxes
                buildDynamicCheckboxes(),

                const SizedBox(height: 16),

                // Apply Button
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     primary: const Color.fromRGBO(
                //         148, 108, 195, 1), // Background color
                //   ),
                //   onPressed: () {
                //     // Implement logic to apply filters
                //     // print('Applied Filters:');
                //     // print('Gender: $selectedGender');
                //     // print('Location: $selectedLocation');
                //     // print('Type: $selectedType');
                //     selectedOptions.forEach((key, value) {
                //       // print('$key: $value');
                //     });
                //     // Add more filters as needed
                //   },
                //   child: const Text(
                //     'Apply',
                //     style: TextStyle(color: Colors.white),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "HOME",
              backgroundColor: Color.fromRGBO(148, 108, 195, 1),
            ),
            BottomNavigationBarItem(
              icon: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(
                      148, 108, 195, 1), // Background color
                ),
                onPressed: () {
                  selectedOptions.forEach((key, value) {
                    // print('$key: $value');
                  });
                  // Add more filters as needed
                },
                child: const Text(
                  'Apply',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              label: "",
              backgroundColor: const Color.fromRGBO(148, 108, 195, 1),
            ),
          ],
          // currentIndex: 0,
          // selectedItemColor: Colors.white,

          onTap: (index) {
            switch (index) {
              case 0:
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => FlutterApp()));
                break;
              case 1:

                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => about()));

                break;
              default:
                break;
            }
          }),
    );
  }

  Widget buildNavigationOption(String title) {
    return GestureDetector(
      onTap: () {
        _updateNavigationOption(title);
        setState(() {
          // Reset selected options for additional sections
          selectedOptions[title] = '';
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          title,
          style: TextStyle(
            color: title == selectedNavigationOption
                ? const Color(0xFF946CC3)
                : Colors.black,
          ),
        ),
      ),
    );
  }

  void _updateNavigationOption(String option) {
    setState(() {
      selectedNavigationOption = option;
    });
  }

  Widget buildDynamicCheckboxes() {
    if (selectedNavigationOption.isNotEmpty) {
      List<String> options = checkboxOptions[selectedNavigationOption] ?? [];
      return buildCheckboxList(selectedNavigationOption, options);
    } else {
      return Container(); // Return an empty container if no option is selected
    }
  }

  Widget buildCheckboxList(String title, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: options.map((option) {
        return buildCheckbox(
          title,
          option,
          options.contains(option),
          (value) {
            setState(() {
              if (value!) {
                selectedOptions[title] = option;
              }
            });
          },
        );
      }).toList(),
    );
  }

  Widget buildCheckbox(
    String title,
    String option,
    bool value,
    void Function(bool?) onChanged,
  ) {
    return InkWell(
      onTap: () {
        onChanged(!value); // Toggle the value
      },
      child: Row(
        children: [
          StatefulBuilder(
            builder: (context, setState) {
              return Checkbox(
                value: value,
                onChanged: (newValue) {
                  setState(() {
                    onChanged(newValue);
                  });
                },
              );
            },
          ),
          Text(
            option,
            style: TextStyle(
              color: value ? const Color(0xFF946CC3) : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  void main() {
    runApp(const MaterialApp(
      home: FilterScreenPage(),
    ));
  }
}

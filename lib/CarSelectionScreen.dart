import 'package:flutter/material.dart';
import 'package:remorquage/AddCarScreen.dart';
import 'package:remorquage/CustomerInfoScreen.dart';
import 'package:remorquage/utils/constants/colors.dart';

class CarSelectionScreen extends StatefulWidget {
  @override
  _CarSelectionScreenState createState() => _CarSelectionScreenState();
}

class _CarSelectionScreenState extends State<CarSelectionScreen> {
  List<Map<String, dynamic>> cars = [
    {'name': 'Toyota Corolla I23 TU 456', 'selected': false},
    {'name': 'Peugeot 208 789 ABC I23', 'selected': false},
    {'name': 'BMW X5 456 DEF 789', 'selected': false},
    {'name': 'Toyota Corolla I23 TU 456', 'selected': false},
    {'name': 'Peugeot 208 789 ABC I23', 'selected': false},
    {'name': 'BMW X5 456 DEF 789', 'selected': false},
    {'name': 'Toyota Corolla I23 TU 456', 'selected': false},
  ];

  void toggleSelection(int index) {
    setState(() {
      cars[index]['selected'] = !cars[index]['selected'];
    });
  }

  void addCar() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddCarScreen()),
    );
  }

  void nextStep() {
    bool atLeastOneSelected = cars.any((car) => car['selected'] == true);

    if (!atLeastOneSelected) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select at least one vehicle'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => CustomerInfoScreen(
              selectedCars: cars.where((car) => car['selected']).toList(),
            ),
      ),
    );
  }

  Widget buildStepIndicator() {
    return Row(
      children: [
        Expanded(child: Container(height: 8, color: const Color(0xFFF2D164))),
        Expanded(child: Container(height: 8, color: Colors.black)),
        Expanded(child: Container(height: 8, color: Colors.black)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Center(
          child: Text(
            'Step 1',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ),
        actions: [SizedBox(width: 48)],
      ),
      body: Container(
        color: TColors.primary,
        child: Column(
          children: [
            buildStepIndicator(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Please select your car(s):',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFF2D164),
                      ),
                    ),
                    SizedBox(height: 16),
                    Expanded(
                      child: ListView.builder(
                        itemCount: cars.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            color:
                                cars[index]['selected']
                                    ? const Color(0xFFDDF3F2)
                                    : Colors.white,
                            child: ListTile(
                              leading: Icon(
                                Icons.directions_car,
                                color: Colors.blue,
                              ),
                              title: Text(cars[index]['name']),
                              trailing: Checkbox(
                                value: cars[index]['selected'],
                                onChanged: (value) => toggleSelection(index),
                                activeColor: Colors.green,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: addCar,
                      child: Text('Add car'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Cancel'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 16,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: nextStep,
                          child: Text('Next'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

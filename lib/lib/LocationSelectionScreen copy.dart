import 'package:flutter/material.dart';
import 'package:remorquage/LocationConfirmationScreen%20copy.dart';
import 'package:remorquage/LocationConfirmationScreen.dart';
import 'package:remorquage/utils/constants/colors.dart';

class LocationSelectionScreen2 extends StatefulWidget {
  const LocationSelectionScreen2({Key? key}) : super(key: key);

  @override
  State<LocationSelectionScreen2> createState() =>
      _LocationSelectionScreenState();
}

class _LocationSelectionScreenState extends State<LocationSelectionScreen2> {
  final TextEditingController pickUpController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();

  final FocusNode pickUpFocusNode = FocusNode();
  final FocusNode destinationFocusNode = FocusNode();

  final List<Map<String, String>> recentPlaces = [
    {
      'name': 'Office',
      'address': '2972 Westheimer Rd, Santa Ana, Illinois 85048',
      'distance': '2.7km',
    },
    {
      'name': 'Coffee shop',
      'address': '1901 Thornridge Cir, Shiloh, Hawaii 81063',
      'distance': '1.1km',
    },
    {
      'name': 'Shopping center',
      'address': '4140 Parker Rd, Allentown, New Mexico 31134',
      'distance': '4.9km',
    },
    {
      'name': 'Shopping mall',
      'address': '4140 Parker Rd, Allentown, New Mexico 31134',
      'distance': '4.0km',
    },
  ];

  bool get areFieldsFilled =>
      pickUpController.text.isNotEmpty && destinationController.text.isNotEmpty;

  @override
  void dispose() {
    pickUpController.dispose();
    destinationController.dispose();
    pickUpFocusNode.dispose();
    destinationFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset('assets/images/maps.jpeg', fit: BoxFit.cover),
          ),

          // White panel
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      'Select address',
                      style: TextStyle(
                        color: TColors.primary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Pickup field
                  _buildTextField(
                    controller: pickUpController,
                    label: 'Pick-up location',
                    focusNode: pickUpFocusNode,
                    onFieldSubmitted: (_) {
                      if (areFieldsFilled) _navigateToConfirmation();
                    },
                  ),
                  const SizedBox(height: 16),

                  // Destination field
                  _buildTextField(
                    controller: destinationController,
                    label: 'Destination location',
                    focusNode: destinationFocusNode,
                    onFieldSubmitted: (_) {
                      if (areFieldsFilled) _navigateToConfirmation();
                    },
                  ),

                  const SizedBox(height: 20),

                  // Confirm button
                  if (areFieldsFilled)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: TColors.primary,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: _navigateToConfirmation,
                        child: const Text(
                          'Confirm Locations',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    )
                  else
                    Expanded(
                      child: ListView.builder(
                        itemCount: recentPlaces.length,
                        itemBuilder: (context, index) {
                          final place = recentPlaces[index];
                          return ListTile(
                            leading: const Icon(
                              Icons.location_on,
                              color: Colors.yellow,
                            ),
                            title: Text(
                              place['name'] ?? '',
                              style: const TextStyle(color: Colors.black),
                            ),
                            subtitle: Text(
                              place['address'] ?? '',
                              style: const TextStyle(color: Colors.grey),
                            ),
                            trailing: Text(
                              place['distance'] ?? '',
                              style: const TextStyle(color: Colors.black),
                            ),
                            onTap: () {
                              if (pickUpController.text.isEmpty) {
                                pickUpController.text = place['name'] ?? '';
                              } else if (destinationController.text.isEmpty) {
                                destinationController.text =
                                    place['name'] ?? '';
                              }
                            },
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToConfirmation() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => LocationConfirmationScreen2(
              currentLocation: pickUpController.text,
              destination: destinationController.text,
              isNowSelected: true, // ou false selon le besoin
            ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required FocusNode focusNode,
    void Function(String)? onFieldSubmitted,
  }) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white.withOpacity(0.9),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        prefixIcon: Icon(Icons.location_on, color: TColors.primary),
      ),
      style: const TextStyle(color: Colors.black),
      onSubmitted: onFieldSubmitted,
    );
  }
}

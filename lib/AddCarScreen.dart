import 'package:flutter/material.dart';
import 'package:remorquage/ForeignVehicleScreen.dart';
import 'package:remorquage/utils/constants/colors.dart';

class AddCarScreen extends StatefulWidget {
  @override
  _AddCarScreenState createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController licensePlateController;
  String? makeModel;
  String? vehicleType;
  String? insuranceProvider;

  @override
  void initState() {
    super.initState();
    licensePlateController = TextEditingController();
    vehicleType = 'Motorcycle'; // Valeur par défaut
  }

  @override
  void dispose() {
    licensePlateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary, // Fond bleu principal
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // Ferme le clavier
        },
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header avec image, titre et bouton Foreign Vehicle
                  Stack(
                    children: [
                      // Image et titre centrés
                      Center(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/vehicule.png',
                              height: 80,
                              width: 80,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Vehicle Information',
                              style: TextStyle(
                                color: Color(0xFFFFC700), // Jaune
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Bouton Foreign Vehicle aligné à droite
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: TColors.primary, // Même couleur que le fond
                            borderRadius: BorderRadius.circular(17),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(
                                  0.25,
                                ), // Ombre 25%
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: TextButton(
                            onPressed: () {
                              // Navigation vers la nouvelle page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForeignVehicleScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Foreign Vehicle >',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 6,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // License Plate Number
                  Text(
                    'License Plate Number',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: licensePlateController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the license plate number';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      hintText: 'Enter license plate number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintStyle: TextStyle(color: Colors.white70),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 20),

                  // Make & Model (Dropdown)
                  Text(
                    'Make & Model',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    dropdownColor: TColors.primary,
                    items:
                        [
                          'Peugeot 208',
                          'Toyota Corolla',
                          'BMW X5',
                          'Other',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                    onChanged: (value) {
                      setState(() {
                        makeModel = value;
                      });
                    },
                    value: makeModel,
                    hint: Text(
                      'Select make & model',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Vehicle Type (Dropdown)
                  Text(
                    'Vehicle Type',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    dropdownColor: TColors.primary,
                    items:
                        ['Motorcycle', 'Car', 'Van', 'Truck'].map((
                          String value,
                        ) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                    onChanged: (value) {
                      setState(() {
                        vehicleType = value;
                      });
                    },
                    value: vehicleType,
                  ),
                  SizedBox(height: 20),

                  // Upload Insurance Card Photo
                  Text(
                    'Upload an insurance card photo',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: () {
                      print('Upload Insurance Card');
                    },
                    icon: Icon(Icons.upload_file, color: Colors.white),
                    label: Text(
                      'Upload Insurance Card',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),

                  // Assurance Section
                  Text(
                    'Are you insured?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'If you have insurance, please provide the details below. Otherwise, leave it blank.',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(height: 20),

                  // Policy Number
                  Text(
                    'Enter Insurance Policy Number:',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintStyle: TextStyle(color: Colors.white70),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 20),

                  // Insurance Provider (Dropdown)
                  Text(
                    'Select Insurance Provider:',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    dropdownColor: TColors.primary,
                    items:
                        ['Allianz', 'AXA', 'Generali', 'Other'].map((
                          String value,
                        ) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                    onChanged: (value) {
                      setState(() {
                        insuranceProvider = value;
                      });
                    },
                    value: insuranceProvider,
                    hint: Text(
                      'Select insurance provider',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),

                  // Upload Insurance Card Again
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      print('Upload Insurance Card');
                    },
                    icon: Icon(Icons.upload_file, color: Colors.white),
                    label: Text(
                      'Upload Insurance Card',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  // Buttons Cancel / Save
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              print('Form validated and saved!');
                              Navigator.pop(context);
                            }
                          },
                          child: Text('Save & Add Vehicle'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

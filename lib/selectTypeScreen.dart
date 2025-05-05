import 'package:flutter/material.dart';
import 'package:remorquage/CustomerInfoScreen%20copy.dart';
import 'package:remorquage/utils/constants/colors.dart';

class SelectTypeScreen extends StatefulWidget {
  const SelectTypeScreen({Key? key}) : super(key: key);

  @override
  State<SelectTypeScreen> createState() => _SelectTypeScreenState();
}

class _SelectTypeScreenState extends State<SelectTypeScreen> {
  bool isHeavyDutySelected = false;
  bool isLightVehicleSelected = false;
  bool isSUV4x4Selected = false;
  bool isVanPickupTruckSelected = false;

  void _handleSelection(String vehicleType) {
    setState(() {
      isHeavyDutySelected = vehicleType == 'Heavy-Duty';
      isLightVehicleSelected = vehicleType == 'Light Vehicle';
      isSUV4x4Selected = vehicleType == 'SUV / 4x4';
      isVanPickupTruckSelected = vehicleType == 'Van / Pickup Truck';
    });
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
        centerTitle: true,
        title: Text(
          'Step 2',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ligne de progression : 1/3 jaune, 2/3 noir
          Row(
            children: [
              Expanded(
                flex: 1, // Étape en cours
                child: Container(height: 6, color: Colors.amber),
              ),
              Expanded(
                flex: 2, // Étapes restantes
                child: Container(height: 6, color: Colors.black),
              ),
            ],
          ),

          // Reste du contenu
          Expanded(
            child: Container(
              color: TColors.primary,
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24),
                  Text(
                    "Select your vehicle type to proceed:",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(height: 24),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: [
                      _buildVehicleOption(
                        icon: Icons.construction,
                        label: "Heavy-Duty",
                        isSelected: isHeavyDutySelected,
                        onTap: () => _handleSelection('Heavy-Duty'),
                      ),
                      _buildVehicleOption(
                        icon: Icons.directions_car,
                        label: "Light Vehicle",
                        isSelected: isLightVehicleSelected,
                        onTap: () => _handleSelection('Light Vehicle'),
                      ),
                      _buildVehicleOption(
                        icon: Icons.local_shipping,
                        label: "SUV / 4x4",
                        isSelected: isSUV4x4Selected,
                        onTap: () => _handleSelection('SUV / 4x4'),
                      ),
                      _buildVehicleOption(
                        icon: Icons.local_shipping,
                        label: "Van / Pickup Truck",
                        isSelected: isVanPickupTruckSelected,
                        onTap: () => _handleSelection('Van / Pickup Truck'),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.red,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text("Cancel"),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        CustomerInfoScreen2(selectedCars: []),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text("Next"),
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
    );
  }

  Widget _buildVehicleOption({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final backgroundColor =
        isSelected ? Colors.lightGreenAccent : const Color(0xFFDDF3F2);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: TColors.primary),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

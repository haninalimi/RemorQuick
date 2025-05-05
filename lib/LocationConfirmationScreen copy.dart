import 'package:flutter/material.dart';
import 'package:remorquage/SelectTimeScreen.dart';
import 'package:remorquage/selectTypeScreen.dart';
import 'package:remorquage/utils/constants/colors.dart';

class LocationConfirmationScreen2 extends StatelessWidget {
  final String currentLocation;
  final String destination;

  const LocationConfirmationScreen2({
    Key? key,
    required this.currentLocation,
    required this.destination,
    required bool isNowSelected,
    DateTime? scheduledDate,
  }) : super(key: key);

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
                  SizedBox(height: 20),

                  ListTile(
                    leading: Icon(Icons.location_on, color: Colors.green),
                    title: Text('Current location'),
                    subtitle: Text(currentLocation),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on, color: Colors.redAccent),
                    title: Text('Destination'),
                    subtitle: Text(destination),
                  ),

                  Spacer(),

                  // Adjusted Confirm Location button
                  ElevatedButton(
                    onPressed: () {
                      // Navigue vers la page SelectTimeScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectTypeScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TColors.primary,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: Size(double.infinity, 70),
                    ),
                    child: Text(
                      'Confirm Location',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
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
}

import 'package:flutter/material.dart';
import 'package:remorquage/lib/LocationSelectionScreen.dart';
import 'package:remorquage/utils/constants/colors.dart';

class CustomerInfoScreen extends StatelessWidget {
  final List<Map<String, dynamic>> selectedCars;

  const CustomerInfoScreen({Key? key, required this.selectedCars})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Step 2',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        color: TColors.primary,
        child: Column(
          children: [
            _buildProgressIndicator(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildHeader(),
                    SizedBox(height: 20),
                    _buildForm(context),
                    Spacer(),
                    _buildActionButtons(context),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Row(
      children: [
        Expanded(child: Container(height: 8, color: const Color(0xFFF2D164))),
        Expanded(child: Container(height: 8, color: const Color(0xFFF2D164))),
        Expanded(child: Container(height: 8, color: Colors.black)),
      ],
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Image.asset('assets/images/client.png', height: 100, width: 100),
        SizedBox(height: 10),
        Text(
          'Customer Information',
          style: TextStyle(
            color: Color(0xFFFFC700),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    return Column(
      children: [
        _buildTextField(
          context: context,
          label: 'Full Name',
          keyboardType: TextInputType.text,
        ),
        SizedBox(height: 16),
        _buildTextField(
          context: context,
          label: 'Phone Number',
          keyboardType: TextInputType.phone,
        ),
        SizedBox(height: 16),
        _buildTextField(
          context: context,
          label: 'Another Phone Number',
          keyboardType: TextInputType.phone,
        ),
      ],
    );
  }

  Widget _buildTextField({
    required BuildContext context,
    required String label,
    required TextInputType keyboardType,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      style: TextStyle(color: Colors.white),
      keyboardType: keyboardType,
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LocationSelectionScreen(),
                ),
              );
            },
            child: Text('Next'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
      ],
    );
  }
}

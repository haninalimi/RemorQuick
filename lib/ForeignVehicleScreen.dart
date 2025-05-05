import 'package:flutter/material.dart';
import 'package:remorquage/utils/constants/colors.dart' show TColors;

class ForeignVehicleScreen extends StatefulWidget {
  @override
  _ForeignVehicleScreenState createState() => _ForeignVehicleScreenState();
}

class _ForeignVehicleScreenState extends State<ForeignVehicleScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController foreignPlateController;
  String? makeModel;
  String? vehicleType;
  String? countryOfRegistration;
  String? registrationDocPath;

  @override
  void initState() {
    super.initState();
    foreignPlateController = TextEditingController();
    vehicleType = 'Motorcycle';
  }

  @override
  void dispose() {
    foreignPlateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
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
                          'Foreign Vehicle Information',
                          style: TextStyle(
                            color: Color(0xFFFFC700),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  _buildDropdownField(
                    title: 'Country of Registration',
                    items: ['Italy', 'France', 'Germany', 'Spain', 'Other'],
                    value: countryOfRegistration,
                    onChanged:
                        (value) =>
                            setState(() => countryOfRegistration = value),
                  ),
                  SizedBox(height: 20),

                  _buildTextField(
                    title: 'Foreign Plate Number',
                    controller: foreignPlateController,
                    hint: 'Enter foreign plate number',
                    validator:
                        (value) => value!.isEmpty ? 'Required field' : null,
                  ),
                  SizedBox(height: 20),

                  _buildDropdownField(
                    title: 'Make & Model',
                    items: ['Peugeot 208', 'Toyota Corolla', 'BMW X5', 'Other'],
                    value: makeModel,
                    onChanged: (value) => setState(() => makeModel = value),
                  ),
                  SizedBox(height: 20),

                  _buildDropdownField(
                    title: 'Vehicle Type',
                    items: ['Motorcycle', 'Car', 'Van', 'Truck'],
                    value: vehicleType,
                    onChanged: (value) => setState(() => vehicleType = value),
                  ),
                  SizedBox(height: 30),

                  Text(
                    'Vehicle Registration Document',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Upload a clear copy of the vehicle registration document',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(height: 15),

                  ElevatedButton.icon(
                    onPressed: _uploadRegistrationDocument,
                    icon: Icon(Icons.upload_file, color: Colors.white),
                    label: Text(
                      registrationDocPath != null
                          ? 'Document uploaded ✓'
                          : 'Upload Registration',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          registrationDocPath != null
                              ? Colors.green
                              : Colors.blueAccent,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  if (registrationDocPath != null)
                    Text(
                      'Document ready',
                      style: TextStyle(color: Colors.green, fontSize: 12),
                    ),
                  SizedBox(height: 30),

                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Cancel'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _validateForm,
                          child: Text('Save Vehicle'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _uploadRegistrationDocument() async {
    setState(() => registrationDocPath = '/path/to/registration.pdf');
  }

  void _validateForm() {
    if (_formKey.currentState!.validate() && registrationDocPath != null) {
      _saveVehicleData();
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please upload the registration document'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _saveVehicleData() {
    final vehicleData = {
      'country': countryOfRegistration,
      'plate': foreignPlateController.text,
      'model': makeModel,
      'type': vehicleType,
      'docPath': registrationDocPath,
    };
    print('Vehicle saved: $vehicleData');
    // Envoyer les données à votre backend ici
  }

  Widget _buildTextField({
    required String title,
    required TextEditingController controller,
    required String hint,
    required String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.1),
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.white),
            ),
            hintStyle: TextStyle(color: Colors.white70),
          ),
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String title,
    required List<String> items,
    required String? value,
    required void Function(String?)? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
        SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.1),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          dropdownColor: TColors.primary,
          items:
              items
                  .map(
                    (value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: TextStyle(color: Colors.white)),
                    ),
                  )
                  .toList(),
          onChanged: onChanged,
          value: value,
          hint: Text('Select $title', style: TextStyle(color: Colors.white70)),
        ),
      ],
    );
  }
}

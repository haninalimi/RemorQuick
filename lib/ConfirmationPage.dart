import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:remorquage/OTPverificationScreen.dart';
import 'package:remorquage/payment_page.dart';
import 'package:remorquage/utils/constants/colors.dart';

class ConfirmationPage extends StatefulWidget {
  final bool isNowSelected;
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;

  final String userName; // Nom complet
  final String vehiclePlate; // Immatriculation
  final String vehicleBrand; // Marque
  final String pickupLocation;
  final String destination;

  const ConfirmationPage({
    Key? key,
    required this.isNowSelected,
    this.selectedDate,
    this.selectedTime,
    required this.userName,
    required this.vehiclePlate,
    required this.vehicleBrand,
    required this.pickupLocation,
    required this.destination,
  }) : super(key: key);

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  bool _isLoading = false;

  String getFormattedDateTime(BuildContext context) {
    if (widget.isNowSelected) {
      return "As soon as possible";
    } else if (widget.selectedDate != null && widget.selectedTime != null) {
      final formattedDate = DateFormat.yMMMMd().format(widget.selectedDate!);
      final formattedTime = widget.selectedTime!.format(context);
      return "$formattedDate at $formattedTime";
    }
    return "N/A";
  }

  Widget buildInfoRow(String title, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(icon, color: TColors.primary),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 16),
                children: [
                  TextSpan(
                    text: "$title: ",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: value),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onConfirm() async {
    setState(() => _isLoading = true);

    // Simule un délai de traitement
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() => _isLoading = false);

    // Navigation vers la page d'OTP
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OtpVerificationScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        title: const Text("Confirmation"),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: TColors.primary),
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: TColors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Confirm Your Details",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),

                buildInfoRow("Name", widget.userName, Icons.person),
                buildInfoRow(
                  "Vehicle Plate",
                  widget.vehiclePlate,
                  Icons.directions_car,
                ),
                buildInfoRow("Brand", widget.vehicleBrand, Icons.car_repair),
                buildInfoRow(
                  "Pickup",
                  widget.pickupLocation,
                  Icons.location_on,
                ),
                buildInfoRow("Destination", widget.destination, Icons.flag),
                buildInfoRow(
                  "Scheduled For",
                  getFormattedDateTime(context),
                  Icons.schedule,
                ),

                const Spacer(),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: TColors.primary.withOpacity(0.4),
                        blurRadius: 10,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: ElevatedButton.icon(
                    onPressed: _isLoading ? null : _onConfirm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                    ),
                    icon:
                        _isLoading
                            ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                            : const Icon(Icons.check, color: Colors.white),
                    label: Text(
                      _isLoading
                          ? "Please wait..."
                          : (widget.isNowSelected
                              ? "Request Now"
                              : "Confirm Schedule"),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

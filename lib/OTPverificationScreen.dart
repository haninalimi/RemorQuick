import 'package:flutter/material.dart';
import 'package:remorquage/payment_page.dart';
import 'package:remorquage/utils/constants/colors.dart'; // Assure-toi que cette importation est correcte

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<String> otpDigits = ['1', '0', '8', '7']; // Exemple de code OTP
  final List<TextEditingController> controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  void navigateToPaymentScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PaymentScreen()),
    );
  }

  @override
  void initState() {
    super.initState();

    // Ajouter un listener à chaque champ pour détecter les changements
    for (var controller in controllers) {
      controller.addListener(_checkAllFieldsFilled);
    }
  }

  @override
  void dispose() {
    // Supprimer les listeners pour éviter les fuites de mémoire
    for (var controller in controllers) {
      controller.removeListener(_checkAllFieldsFilled);
      controller.dispose(); // Bonne pratique
    }
    super.dispose();
  }

  void _checkAllFieldsFilled() {
    // Vérifier si tous les champs sont remplis
    if (controllers.every((c) => c.text.isNotEmpty)) {
      String enteredOtp = controllers.map((c) => c.text).join('');
      String expectedOtp = otpDigits.join('');

      if (enteredOtp == expectedOtp) {
        navigateToPaymentScreen();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid OTP'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
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
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar avec icône Lock
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              child: Icon(
                Icons.lock,
                size: 40,
                color: TColors.primary, // Couleur principale
              ),
            ),
            SizedBox(height: 16),

            // Titre "Verify Now"
            Text(
              'Verify Now',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: TColors.primary,
              ),
            ),
            SizedBox(height: 8),

            // Texte d'info
            Text(
              'We have sent the verification code to your phone',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),

            SizedBox(height: 24),

            // Champs OTP
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey[300]!),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: controllers[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 3) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                );
              }),
            ),

            SizedBox(height: 24),

            // Bouton Resend
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  print('Resend OTP');
                },
                child: Text(
                  "Don't receive the OTP? Resend",
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

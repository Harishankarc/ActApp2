import 'package:actapp/backend/api.dart';
import 'package:actapp/widgets/appButton.dart';
import 'package:actapp/widgets/appText.dart';
import 'package:actapp/widgets/appTextFeild.dart';
import 'package:flutter/material.dart';

class OtpEmail extends StatefulWidget {
  const OtpEmail({super.key});

  @override
  State<OtpEmail> createState() => _OtpEmailState();
}

class _OtpEmailState extends State<OtpEmail> {
  final _controllers = List.generate(4, (_) => TextEditingController());
  final _focusNodes = List.generate(4, (_) => FocusNode());

  void _onOtpChanged(String value, int index) {
    if (value.length == 1 && index < _focusNodes.length - 1) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(
                  'assets/images/otpimg2.png',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 80),
              AppText.heading(
                'Enter your verification code',
                weight: FontWeight.w600,
              ),
              SizedBox(height: 10),
              AppText.subtitle(
                'A 4 - digit code has been sent to ',
                weight: FontWeight.w500,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText.subtitle('sample@gmail.com', weight: FontWeight.w500),
                  SizedBox(width: 5),
                  AppText.subtitle(
                    'Change',
                    weight: FontWeight.w500,
                    color: Colors.blue,
                  ),
                ],
              ),
              SizedBox(height: 80),
              Row(
                children: List.generate(4, (index) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: AppTextFeild(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        hintText: '',
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        onChanged: (value) => _onOtpChanged(value, index),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 5),
                  AppText.subtitle(
                    'Resend',
                    weight: FontWeight.w600,
                    color: Colors.blue,
                  ),
                ],
              ),
              SizedBox(height: 120),
              AppButton(text: 'Verify OTP', onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => _buildOtpConfirmModal(context),
                  );
              },gradientColors: [Colors.black,Colors.black],textStyle: TextStyle(color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildOtpConfirmModal(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical:50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Colors.yellow,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, size: 40, color: Colors.black),
            ),
            const SizedBox(height: 20),

            AppText.heading(
              'Verified',
              weight: FontWeight.w600,
            ),
            const SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText.subtitle(
                  'Your Phone no is',
                  weight: FontWeight.w500,
                ),
                AppText.subtitle(
                  'successfully Verified',
                  weight: FontWeight.w500,
                ),

              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child:  AppButton(
                text: 'Continue',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:actapp/backend/api.dart';
import 'package:actapp/routetransitions.dart';
import 'package:actapp/widgets/appButton.dart';
import 'package:actapp/widgets/appText.dart';
import 'package:actapp/widgets/appTextFeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class Login2 extends StatefulWidget {
  const Login2({super.key});

  @override
  State<Login2> createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  bool isObsured = true;
  String? _selectedCountryCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: API.appcolor,
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Image.asset('assets/images/bg.png', fit: BoxFit.cover),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.68,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: API.cardcolor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.smalltitle('Name'),
                              SizedBox(height: 5),
                              AppTextFeild(hintText: 'Enter name'),
                            ],
                          ),
                          SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.smalltitle('Email ID'),
                              SizedBox(height: 5),
                              AppTextFeild(hintText: 'Enter email'),
                            ],
                          ),
                          SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.smalltitle('Phone No'),
                              SizedBox(height: 5),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/india.png',
                                      height: 40,
                                    ),
                                    SizedBox(width: 20),
                                    Container(
                                      height: 40,
                                      width: 1,
                                      color: Colors.grey.shade600,
                                    ),
                                    SizedBox(width: 20),
                                    Expanded(
                                      child: AppTextFeild(
                                        hintText: '+91 0000000000',
                                        noBorder: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          AppButton(
                            text: "Next",
                            onPressed: () {
                              // slideRightWidget(
                              //   newPage: VerificationOtp(),
                              //   context: context,
                              // );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * 0.2,
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  child: Image.asset('assets/images/actlogo2.png',
                      height: 120, width: 150),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

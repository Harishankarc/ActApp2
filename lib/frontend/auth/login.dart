import 'package:actapp/backend/api.dart';
import 'package:actapp/routetransitions.dart';
import 'package:actapp/widgets/appButton.dart';
import 'package:actapp/widgets/appText.dart';
import 'package:actapp/widgets/appTextFeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isObsured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: API.appcolor,
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/bg2.png',
              fit: BoxFit.cover,
            ),
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
                          AppText.heading('Login',size: 30,),
                          SizedBox(height: 40),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.smalltitle('Username'),
                              SizedBox(height: 5),
                              AppTextFeild(hintText: 'Username@gmail.com'),
                            ],
                          ),
                          SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.smalltitle('Password'),
                              SizedBox(height: 5),
                              AppTextFeild(
                                hintText: '***********',
                                obscureText: isObsured ? true : false,
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isObsured = !isObsured;
                                      HapticFeedback.lightImpact();
                                    });
                                  },
                                  child: isObsured
                                      ? Icon(LucideIcons.eyeOff, size: 20)
                                      : Icon(LucideIcons.eye, size: 20),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                      Column(
                        children: [
                          AppButton(
                            text: "Login",
                            onPressed: () {
                              // slideRightWidget(
                              //   newPage: VerificationOtp(),
                              //   context: context,
                              // );
                            },
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText.smalltitle('Forgot Password ?'),
                            ],
                          ),
                          SizedBox(height: 50),
                          AppText.verysmalltitle(
                            'By login in you are agreeing to our',
                            color: Colors.grey.shade600,
                          ),
                          AppText.verysmalltitle(
                            'terms and conditions etc',
                            color: Colors.grey.shade600, 
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
                  child: Image.asset(
                    'assets/images/actlogo2.png',
                    height: 120,
                    width: 150,
                  )
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:phone_auth_app/AuthController.dart';
import 'package:phone_auth_app/CustomInput.dart';
import 'package:phone_auth_app/HomePage.dart';

class Verification extends StatelessWidget {
  String verificationId;
  Verification({super.key, required this.verificationId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: GetBuilder(
          init: AuthController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Verify OTP',
                    style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomInput(
                    label: 'Enter OTP',
                    controller:controller.otpController,
                    prefixIcon: Icons.phone, ontap: () {  },),
                  SizedBox(height: 18,),

                  GestureDetector(
                    onTap: () async{
                      try{
                        PhoneAuthCredential credentials = await PhoneAuthProvider.credential(verificationId: verificationId, smsCode: controller.otpController.text.toString());
                        FirebaseAuth.instance.signInWithCredential(credentials).then((value) {
                          Get.to(HomePage());
                        });
                        
                      }catch(e){}
                    },
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.deepPurple,
                      ),
                      child:const Center(
                          child: Text(
                            'Continue',
                            style: TextStyle(
                                color: Colors.white, fontSize: 20),
                          )),
                    ),
                  ),
                  SizedBox(height: 10,),
                  OtpTimerButton(onPressed: (){controller.signInWithPhone();}, text: Text('Resend OTP'), duration: 30,backgroundColor: Colors.deepPurple ,height: 50,textColor: Colors.white,)

                ],
              ),
            );
          },
        ));
  }
}



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_auth_app/AuthController.dart';
import 'package:phone_auth_app/CustomInput.dart';

class PhoneAuth extends StatelessWidget {
  PhoneAuth({super.key});

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
                    'Continue with phone ',
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
                    label: 'Enter Phone',
                    controller:controller.phoneController,
                    prefixIcon: Icons.phone, ontap: () {  },),
                  SizedBox(height: 18,),

                  GestureDetector(
                    onTap: () {
                      controller.signInWithPhone();
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

                ],
              ),
            );
          },
        ));
  }
}

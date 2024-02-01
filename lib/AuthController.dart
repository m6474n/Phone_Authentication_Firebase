import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:phone_auth_app/Verification.dart';

class AuthController extends GetxController {
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  signInWithPhone() async{
    await auth.verifyPhoneNumber(
        phoneNumber: phoneController.text,
        verificationCompleted: (PhoneAuthCredential credentials) {},
        verificationFailed: (FirebaseAuthException ex) {
          Get.snackbar(ex.toString(), "message");
        },
        codeSent: (verificationId, token) {
          Get.to(Verification(verificationId: verificationId));
        },
        codeAutoRetrievalTimeout: (e) {

        });
  }



}

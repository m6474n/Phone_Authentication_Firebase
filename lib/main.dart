import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_auth_app/testScreene.dart';

import 'LoginScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FirebasePhoneAuthProvider(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Phone Auth',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: PhoneAuth()
      ),
    );
  }
}


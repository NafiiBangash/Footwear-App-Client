import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:footware_client/controllers/home_controller.dart';
import 'package:footware_client/controllers/login_controller.dart';
import 'package:footware_client/firebase_options.dart';
import 'package:footware_client/pages/login_page.dart';
import 'package:footware_client/pages/register_page.dart';
import 'package:footware_client/pages/splash_page.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions);
  Get.put(LoginController());
  Get.put(HomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Footware Client',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashPage(),
    );
  }
}

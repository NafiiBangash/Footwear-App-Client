import 'package:flutter/material.dart';
import 'package:footware_client/controllers/login_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  LoginController controller = LoginController();
  @override
  void initState() {
    // TODO: implement initState
    controller.setInitialScreen(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Show a loading indicator
      ),
    );
  }
}

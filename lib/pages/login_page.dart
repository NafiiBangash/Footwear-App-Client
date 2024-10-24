import 'package:flutter/material.dart';
import 'package:footware_client/controllers/login_controller.dart';
import 'package:footware_client/pages/home_page.dart';
import 'package:footware_client/pages/register_page.dart';
import 'package:footware_client/widgets/my_button.dart';
import 'package:footware_client/widgets/my_text_field.dart';
import 'package:get/get.dart';


TextEditingController numController = TextEditingController();
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (ctrl) {
        return Scaffold(
          body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.blueGrey[50]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome back!',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                MyTextField(label: 'Email', controller: ctrl.loginEmailCtrl),
                SizedBox(height: 20),
                MyTextField(label: 'Password', controller: ctrl.loginPasswordCtrl),
                SizedBox(height: 20),
                MyButton(title: 'Login',loading: ctrl.loading,onTap: (){
                  ctrl.signIn();
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t hava an account?'),
                    TextButton(onPressed: (){
                      Get.to(()=> const RegisterPage());
                    }, child: const Text('Register',style: TextStyle(color: Colors.deepPurple),)),
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }
}

import 'package:flutter/material.dart';
import 'package:footware_client/controllers/login_controller.dart';
import 'package:footware_client/pages/login_page.dart';
import 'package:footware_client/widgets/my_button.dart';
import 'package:footware_client/widgets/my_text_field.dart';
import 'package:footware_client/widgets/otp_text_field.dart';
import 'package:get/get.dart';



class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (ctrl) {
        return Scaffold(
          body: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blueGrey[50]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Create Account',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                MyTextField(label: 'Full Name', controller: ctrl.registerNameCtrl),
                SizedBox(height: 20),
                MyTextField(label: 'Email', controller: ctrl.registerEmailCtrl),
                SizedBox(height: 20),
                MyTextField(label: 'Password', controller: ctrl.registerPasswordCtrl),
                SizedBox(height: 20,),
                MyButton(title: 'Register',loading: ctrl.loading, onTap: (){
                    ctrl.signUp();
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already hava an account?'),
                    TextButton(onPressed: (){
                      Get.to(()=> const LoginPage());
                    }, child: const Text('Login',style: TextStyle(color: Colors.deepPurple),)),
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

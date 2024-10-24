import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:footware_client/pages/login_page.dart';
import 'package:get/get.dart';
import '../models/user/user.dart';
import '../pages/home_page.dart';

class LoginController extends GetxController{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  late CollectionReference userCollection;
  ///Register text editing controllers
  TextEditingController registerNameCtrl = TextEditingController();
  TextEditingController registerEmailCtrl = TextEditingController();
  TextEditingController registerPasswordCtrl = TextEditingController();
  TextEditingController registerNumberCtrl = TextEditingController();
  ///Sign in text editing controllers
  TextEditingController loginEmailCtrl = TextEditingController();
  TextEditingController loginPasswordCtrl = TextEditingController();

  String? loginUser;

  bool otpFieldShown = false;
  bool loading = false;
  int? otpSend;
  int? otpEnter;


  
  @override
  void onInit() {
    // TODO: implement onInit
    userCollection = _firestore.collection('users');
    super.onInit();
  }
  /// Signup function
  signUp(){
    if(registerNameCtrl.text.isEmpty || registerEmailCtrl.text.isEmpty || registerPasswordCtrl.text.isEmpty){
      Get.snackbar('Error','please fill the fields', colorText: Colors.red);
      return;
    }
    loading = true;
     auth.createUserWithEmailAndPassword(
         email: registerEmailCtrl.text,
         password: registerPasswordCtrl.text).then((value){
           loading = false;
       Get.snackbar('Success', 'User added successfully', colorText: Colors.green);
       Get.to(const LoginPage());
       update();
     }).catchError((error){
       loading = false;
       Get.snackbar('Error',error.toString(), colorText: Colors.red);
       update();
     });
     update();
  }

  ///signIn Function
  signIn(){
    if(loginEmailCtrl.text.isEmpty || loginPasswordCtrl.text.isEmpty){
      Get.snackbar('Error','please fill the fields', colorText: Colors.red);
      return;
    }
    loading = true;
    auth.signInWithEmailAndPassword(email: loginEmailCtrl.text, password: loginPasswordCtrl.text)
        .then((value){
      loading = false;
      Get.snackbar('Success', 'Login Successfully', colorText: Colors.green);
      Get.to(const HomePage());
      update();
    }).catchError((error){
      loading = false;
      Get.snackbar('Error',error.toString(), colorText: Colors.red);
      update();
    });
    update();
  }

  setInitialScreen(BuildContext context){
    User? user = auth.currentUser;

    if(user != null){
      loginUser = user.email.toString();
      Timer(Duration(seconds: 3),()=> Future.delayed(Duration(seconds: 3),()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()))));
    }else{
      Timer(Duration(seconds: 3),()=> Future.delayed(Duration(seconds: 3),()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()))));
    }
  }

  ///signOut
  signOut(){
    auth.signOut().then((value){
      Get.snackbar('Success', 'Sign out successfully', colorText: Colors.green);
      Get.to(const LoginPage());
    }).catchError((error){
      Get.snackbar('Error',error.toString(), colorText: Colors.red);
    });
  }

  addUser() {
    try {
      if(otpSend == otpEnter){
        DocumentReference doc = userCollection.doc();
        UserModel user = UserModel(
          id: doc.id,
          name: registerNameCtrl.text,
          number: int.parse(registerNumberCtrl.text),
        );
        final userJson = user.toJson();
        doc.set(userJson);
        Get.snackbar('Success', 'User added successfully', colorText: Colors.green);
      }else{
        Get.snackbar('Error', 'OTP Is incorrect', colorText: Colors.red);
      }

    } on Exception catch (e) {
      // TODO
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
    }
  }

  /*
  sendOtp(){
    if(registerNameCtrl.text.isEmpty || registerNumberCtrl.text.isEmpty){
      Get.snackbar('Error', 'Please fill the fields',
          colorText: Colors.red
      );
      return;
    }
    final random = Random();
    int otp = 999 + random.nextInt(9000);
    print(otp);
    if(otp != null){
      otpFieldShown = true;
      otpSend = otp;
      Get.snackbar('Success', 'Otp send successfully', colorText: Colors.green);
      update();
    }else{
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
    }
  }
   */

}
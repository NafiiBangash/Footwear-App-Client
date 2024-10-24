import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PurchaseController extends GetxController {
  TextEditingController addressCtrl = TextEditingController();
  double orderPrice = 0.0;
  String itemName = '';
  String orderAddress = '';

  submitOrder({
    required double price,
    required String item,
    required String description,
  }) {
    orderPrice = price;
    itemName = item;
    orderAddress = addressCtrl.text;
  }
}

import 'package:flutter/material.dart';
import 'package:footware_client/controllers/purchase_controller.dart';
import 'package:footware_client/models/product/product.dart';
import 'package:footware_client/widgets/my_text_field.dart';
import 'package:get/get.dart';

class ProductDescriptionPage extends StatelessWidget {
  ProductDescriptionPage({super.key});
  final addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Product product = Get.arguments['data'];
    final size = MediaQuery.of(context).size;
    return  GetBuilder<PurchaseController>(
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Product Details'),
            centerTitle: true,
          ),
          body: SizedBox(
            width: size.width,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        product.image!,
                        height: 250,
                        width: size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(product.name!,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 20),
                    Text(product.description!,style: TextStyle(fontSize: 16),),
                    const SizedBox(height: 20),
                    Text(product.price!.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.green),),
                    const SizedBox(height: 20),
                    MyTextField(label: 'Enter your billing address', controller: addressController,maxLines: 3),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: size.width,
                      child: ElevatedButton(onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                          ),
                          child: Text('Buy Now',style: TextStyle(color: Colors.white),)),
                    ),
                      ]
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}

import 'package:flutter/material.dart';
import 'package:footware_client/controllers/home_controller.dart';
import 'package:footware_client/controllers/login_controller.dart';
import 'package:footware_client/pages/product_description_page.dart';
import 'package:footware_client/widgets/drop_down_widget.dart';
import 'package:footware_client/widgets/multi_select_drop_down_widget.dart';
import 'package:footware_client/widgets/product_card.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (homeCtrl) {
        final loginCtrl = Get.find<LoginController>();
        return RefreshIndicator(
          onRefresh: () async{
            homeCtrl.fetchProducts();
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Footwear Store'),
              actions: [IconButton(onPressed: () {
                loginCtrl.signOut();
              }, icon: const Icon(Icons.logout))],
            ),
            body: SizedBox(
              width: size.width,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: homeCtrl.productCategories.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: index == 5 - 1 ? 10 : 0),
                            child: InkWell(
                              onTap: (){
                                homeCtrl.filterByCategory(homeCtrl.productCategories[index].name!);
                              },
                                child: Chip(label: Text(homeCtrl.productCategories[index].name!))),
                          );
                        }),
                  ),
                  Row(
                    children: [
                      Flexible(
                          child: MultiSelectDropDownWidget(
                        items: const ['Puma', 'Sketchers', 'Adidas','Clarks'],
                        onSelectionChanged: (selectedItems) {
                          print(selectedItems);
                          homeCtrl.filterByBrand(selectedItems);
                        },
                      )),
                      Flexible(
                        child: DropDownWidget(
                            items: ['Low to High', 'High to Low'],
                            selectedItem: 'Sort',
                            onSelected: (onSelected) {
                              print(onSelected);
                              homeCtrl.sortByPrice(ascending: onSelected == 'Low to High'? true : false);
                            }),
                      ),
                    ],
                  ),
                  Expanded(
                      child: GridView.builder(
                          itemCount: homeCtrl.productShowInUi.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                  childAspectRatio: 0.8),
                          itemBuilder: (context, index) {
                            return ProductCard(
                              imageUrl: homeCtrl.productShowInUi[index].image!,
                              name: homeCtrl.productShowInUi[index].name!,
                              price: homeCtrl.productShowInUi[index].price!,
                              offerTag: '20 % OFF',
                              onTap: (){
                                Get.to(()=> ProductDescriptionPage(),arguments: {'data':homeCtrl.productShowInUi[index]});
                              },
                            );
                          }))
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}

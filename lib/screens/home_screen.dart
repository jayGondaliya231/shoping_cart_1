import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_cart/controllers/mycartController.dart';
import 'package:shoping_cart/screens/mycart.dart';

class Home extends StatelessWidget {
  MyCartController myCartController = Get.put(MyCartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ESHOP"), actions: [
        IconButton(
            onPressed: () {
              Get.to(MyCart());
            },
            icon: Icon(Icons.add_shopping_cart))
      ]),
      body:
          GetBuilder<MyCartController>(builder: (MyCartController controller) {
        if (controller.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    clipBehavior: Clip.antiAlias,
                    elevation: 10,
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: Image.network(
                          "${controller.allProductList[index]['image']}"),
                    ),
                  ),
                  title: Text(
                    "${controller.allProductList[index]['title']}",
                    maxLines: 1,
                  ),
                  subtitle: Text(
                      "Price \$ ${controller.allProductList[index]['price']}"),
                  trailing: IconButton(onPressed: () {
                    myCartController
                        .addToMyCart(controller.allProductList[index]);
                  }, //addCartOnPressed(index),
                      icon: GetBuilder<MyCartController>(builder: (controller) {
                    return Icon(
                      Icons.shopping_cart,
                      color: controller
                              .isCartEnabled(controller.allProductList[index])
                          ? Colors.green
                          : Colors.grey,
                    );
                  })),
                );
              },
              itemCount: controller.allProductList.length);
        }
      }),
      floatingActionButton: FloatingActionButton(onPressed: () {
        // Get.snackbar('title', 'message',
        //     snackPosition: SnackPosition.BOTTOM,
        //     borderRadius: 20,
        //     backgroundColor: Colors.white,
        //     mainButton: TextButton(
        //       onPressed: () {},
        //       child: Text("data"),
        //     ));

        Get.defaultDialog(title: "Title", middleText: "khbejahgfabh");
      }),
    );
  }
}

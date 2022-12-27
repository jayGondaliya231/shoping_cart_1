import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/mycartController.dart';

class MyCart extends StatelessWidget {
  MyCartController myCartController = Get.find<MyCartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MyCart")),
      body: GetBuilder<MyCartController>(builder: (controller) {
        return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                direction: DismissDirection.endToStart,
                key: Key(myCartController.myCartList[index].toString()),
                background: Container(
                    color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Remove From Cart",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )),
                onDismissed: (dismissDirection) {
                  if (dismissDirection == DismissDirection.endToStart) {
                    myCartController
                        .removeToMyCart(myCartController.myCartList[index]);
                  }
                },
                child: ListTile(
                  leading: Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    clipBehavior: Clip.antiAlias,
                    elevation: 10,
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: Image.network(
                          "${myCartController.myCartList[index]['image']}"),
                    ),
                  ),
                  title: Text(
                    "${myCartController.myCartList[index]['title']}",
                    maxLines: 1,
                  ),
                  subtitle: Text(
                      "Price \$ ${myCartController.myCartList[index]['price']}"),
                ),
              );
            },
            itemCount: myCartController.myCartList.length);
      }),
    );
  }
}

import 'package:get/get.dart';
import 'package:shoping_cart/services/Data.dart';

class MyCartController extends GetxController {
  late List<Map<String, dynamic>> allProductList;
  List<Map<String, dynamic>> myCartList = [];
  bool isLoading = true;

  @override
  void onInit() {
    getProductListFromServer().then((value) {
      isLoading = false;
      update();
    });
  }

  Future<void> getProductListFromServer() async {
    allProductList = await ProductService.getProduct();
  }

  bool isCartEnabled(Map<String, dynamic> product) {
    return myCartList.contains(product);
  }

  void addToMyCart(Map<String, dynamic> product) {
    if (isCartEnabled(product)) {
      myCartList.remove(product);
    } else {
      myCartList.add(product);
    }

    update();
  }

  void removeToMyCart(Map<String, dynamic> product) {
    myCartList.remove(product);
    update();
  }
}

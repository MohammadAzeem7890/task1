import 'package:get/get.dart';
import 'package:task1/CartModel.dart';
import 'package:task1/Model.dart';
import 'package:task1/Network.dart';

class Controller extends GetxController {
  var listOfCategoryProducts = List<Data>().obs;

  // Products products;

  var addToProductsList = List<CartModel>().obs;
  var totalPrice = 0.obs;

  var cartList = [].obs;
  var itemCountList = [].obs;

  addToCart(index) {
    // print(itemCountList.length);
    for (int i = 0; i < listOfCategoryProducts.length; i++) {
      if (i == index) {
        if (itemCountList[i] == null || itemCountList[i] == 0) {
          // itemCountList[i] = itemCountList[i] + 1;
          addToProductsList.add(CartModel(
              productName: listOfCategoryProducts[index].name,
              productImage: listOfCategoryProducts[index].featuredImage,
              productPrice: listOfCategoryProducts[index].price,
              numberOrdered: itemCountList[index]));
        }
        if (addToProductsList[index].productName ==
            listOfCategoryProducts[index].name) {
          itemCountList[i] = itemCountList[i] + 1;
          totalPrice.value = totalPrice.value + int.parse(listOfCategoryProducts[index].price);
        }
      }
    }
    print(addToProductsList.length);
    update();
  }


  decreaseCartItem(index) {
    for (int i = 0; i < listOfCategoryProducts.length; i++) {
      if (i == index) {
        // print('current index is ${index}');
        itemCountList[i] = itemCountList[i] == 0 ? 0 : itemCountList[i] - 1;
        totalPrice.value = totalPrice.value - int.parse(listOfCategoryProducts[index].price);
        }
        // print(addToProductsList.length);

        update();
    }
  }

  
  removeFromCart(CartModel cartModel, index){
    decreaseCartItem(index);
    addToProductsList.remove(cartModel);
  }

  getDataFromNetwork() async {
    Network network = Network();
    await network.getProducts();
    listOfCategoryProducts.value = network.listOfData;
    // print(listOfCategoryProducts.value.length);
    while (itemCountList.length < listOfCategoryProducts.length) {
      itemCountList.add(0);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDataFromNetwork();
  }
}

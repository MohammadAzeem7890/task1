import 'package:get/get.dart';
import 'package:task1/Model.dart';
import 'package:task1/Network.dart';

class Controller extends GetxController{

  var listOfCategoryProducts = List<CategoryProduct>().obs;
  Products products;

  var cartList = [].obs;
  var itemCountList = [].obs;

  addToCart(index){
    print(itemCountList.length);
    for(int i = 0; i < listOfCategoryProducts.length; i++){
      if(i == index){
        itemCountList[i] = itemCountList[i] + 1;
      }
    }
    update();
  }

  removeFromCart(index){
    // print(itemCountList.length);
    // print(itemCountList.length);
    for(int i = 0; i < listOfCategoryProducts.length; i++){
      if(i == index){
        print('current index is ${index}');
        itemCountList[i] = itemCountList[i] == 0 ? 0 : itemCountList[i] - 1;
      }
    }
    update();
  }



  getDataFromNetwork() async{
    Network network = Network();
    await network.getProducts();
    listOfCategoryProducts.value = network.categoryProduct;
    while(itemCountList.length < listOfCategoryProducts.length){
      itemCountList.add(0);
    }

    // print(listOfCategoryProducts);
    // print(listOfCategoryProducts[1].productId);
    // listOfCategoryProducts.forEach((element) {
    //   print(element.productId);
    //   print(element.updatedAt);
    //   print(element.createdAt);
    //   print(element.id);
    // });
    print(listOfCategoryProducts.length);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDataFromNetwork();
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/CartModel.dart';
import 'package:task1/Controller.dart';


class CartListScreen extends StatelessWidget {
  final controller = Get.find<Controller>();
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      floatingActionButton: Container(
        height: Get.height * 0.07,
        width: Get.width * 0.4,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(30),
        ),
        child: FloatingActionButton(
          onPressed: (){
            Get.to(CartListScreen());
          },
          backgroundColor: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text('Rs. ${controller.totalPrice.value ?? 0}', style: TextStyle(color: Colors.white, fontSize: 20), overflow: TextOverflow.ellipsis,),),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
            child: Icon(Icons.arrow_back_ios, color: Colors.black,)),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: controller.addToProductsList == null
          ? Center(
              child: Text('No Cart yet!'),
            )
          : ListView.separated(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: FadeInImage.assetNetwork(
                            placeholder: 'assets/images/placeholder.png',
                            image:
                            '${controller.addToProductsList[index].productImage} ?? '
                                '}',
                            height: orientation == Orientation.portrait
                                ? Get.height * 0.09
                                : Get.height * 0.15,
                            width: orientation == Orientation.portrait
                                ? Get.width * 0.15
                                : Get.width * 0.06,
                            fit: BoxFit.fill)),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                            '${controller.addToProductsList[index].productName ?? ''}'),
                        // Text(
                        //   '${controller.addToProductsList[index].productPrice ?? ''}',
                        //   style: TextStyle(color: Colors.black),
                        //   overflow: TextOverflow.ellipsis,
                        //   maxLines: 2,
                        // ),
                        SizedBox(height: 5,),
                        Text(
                          'Rs. ${controller.addToProductsList[index].productPrice ?? ''}',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            // controller.removeFromCart(index);
                            controller.removeFromCart(CartModel(productName: controller.addToProductsList[index].productName,
                              productPrice: controller.addToProductsList[index].productPrice,
                              numberOrdered: controller.addToProductsList[index].numberOrdered,
                              productImage: controller.addToProductsList[index].productImage,
                            ), index);
                          },
                          child: Icon(
                            Icons.remove,
                            color: Colors.black,
                          ),
                        ),
                        Obx(() => Text(
                          '${controller.itemCountList[index]}',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 20),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )),
                        InkWell(
                            onTap: () {
                              controller.addToCart(index);
                            },
                            child: Icon(Icons.add)),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 2,
              thickness: 1,
              color: Colors.black26,
            );
          },
          itemCount: controller.addToProductsList.value.length ?? 0),
    );
  }
}

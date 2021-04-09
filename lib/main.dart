import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/CartListScreen.dart';
import 'package:task1/Controller.dart';
import 'package:task1/Model.dart';

void main() => runApp(MaterialApp(
      title: '',
      home: Task1(),
    ));

class Task1 extends StatelessWidget {
  final controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: Container(
          height: Get.height * 0.07,
          width: Get.width * 0.2,
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
                Icon(Icons.add_shopping_cart_rounded, color: Colors.white,),
                SizedBox(width: 5,),
                Obx(() => Text('${controller.addToProductsList.length ?? 0}', style: TextStyle(color: Colors.white, fontSize: 25), overflow: TextOverflow.ellipsis,),),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Data',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: GetX<Controller>(builder: (snapshot) {
          return snapshot.listOfCategoryProducts.value == null
              ? Center(child: CircularProgressIndicator(backgroundColor: Colors.black45,),)
              : ListView.separated(
                  itemBuilder: (context, index) {
                    Data categoryProduct =
                        snapshot.listOfCategoryProducts.value[index];
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
                                    placeholder:
                                        'assets/images/placeholder.png',
                                    image:
                                        'http://165.227.69.207/rehmat-e-sheree${snapshot.listOfCategoryProducts[index].featuredImage ?? ''}',
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
                                    '${snapshot.listOfCategoryProducts[index].name ?? ''}'),
                                Text(
                                  '${snapshot.listOfCategoryProducts[index].description ?? ''}',
                                  style: TextStyle(color: Colors.black),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                Text(
                                  'Rs. ${snapshot.listOfCategoryProducts[index].price ?? ''}',
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
                                    snapshot.decreaseCartItem(index);
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                  ),
                                ),
                                Obx(() => Text(
                                      '${snapshot.itemCountList.value[index]}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 20),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    )),
                                InkWell(
                                    onTap: () {
                                      snapshot.addToCart(index);
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
                  itemCount: snapshot.listOfCategoryProducts.value.length);
        }),
      ),
    );
  }
}

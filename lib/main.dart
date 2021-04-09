import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/Controller.dart';
import 'package:task1/Model.dart';

void main() => runApp(MaterialApp(
      title: '',
      home: Task1(),
    ));

class Task1 extends StatelessWidget {
  final controller = Get.put(Controller());
  CategoryProduct categoryProduct;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
              ? Text('')
              : ListView.separated(
                  itemBuilder: (context, index) {
                    categoryProduct = snapshot.listOfCategoryProducts[index];
                    return ListTile(
                      leading: Text('${categoryProduct.productId}'),
                      title: Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              snapshot.removeFromCart(index);
                            },
                              child: Icon(Icons.remove)),
                          Obx(() => Text('${snapshot.itemCountList[index]}', style: TextStyle(fontSize: 20),),),
                          GestureDetector(
                            onTap: (){
                              snapshot.addToCart(index);
                            },
                              child: Icon(Icons.add)),
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

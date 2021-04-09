import 'package:task1/Model.dart';
import 'package:dio/dio.dart';

class Network{

  List<Data> listOfData;

  // ignore: missing_return
  Future<Products> getProducts()async{
    Dio dio = Dio();
    var response = await dio.get('http://165.227.69.207/rehmat-e-sheree/public/api/products/hashlob/web-data/products/get/all/auth');
    if(response.statusCode == 200){
      // print(response.data);
      Products products = Products.fromJson(response.data);
      // print(products);
      List<Data> data = products.data;
      listOfData = data;
      // print(listOfData.length);
      // print('this is length ${data.length}');
      // data.forEach((data) {
      //   categoryProduct = data.categoryProduct;
      // });

      // print(categoryProduct);
    }
    else{
      throw Exception('could not get data');
    }
  }
}
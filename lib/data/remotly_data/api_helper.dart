import 'package:dio/dio.dart';
import 'package:e_commerce/model/constants.dart';
import 'package:e_commerce/model/product_moduel.dart';



class ApiHelper{

  static ApiHelper get ()=>ApiHelper();
  
 Future<List<ProductModuel>> fetchDataFromAPI() async {
  try {
    final response = await Dio().get(apiPathConst);

    print(response.statusCode);
    // print(response);
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = response.data as List<dynamic>;
      List<ProductModuel> productList = jsonResponse
          .map((data) => ProductModuel.fromJson(data))
          .toList();
      print("productList");print(productList);
      return productList;
    } else {

      return []; 
    }
  } catch (e) {


    return []; 
  }
}
}

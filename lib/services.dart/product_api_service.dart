import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config.dart';
import '../models/category/category.dart';
import '../models/product/product.dart';

final productApiService = Provider((ref) => APIServiceCategory());

class APIServiceCategory {
  static var client = http.Client();

  Future<List<Product>?> fetchallProducts(String categId) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var ur = "${Config.apiURL}${Config.getAllProductsbyCategory}";
    var url = Uri.parse(ur);

    print('url is: $url');
    print('cat id is $categId');

    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode({"catId": categId}));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return productsFromJson(data['data']);
    } else {
      return [];
    }
  }
}

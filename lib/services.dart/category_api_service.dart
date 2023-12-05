import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config.dart';
import '../models/category/category.dart';

final categoryApiService = Provider((ref) => APIServiceCategory());

class APIServiceCategory {
  static var client = http.Client();

  Future<List<Category>?> getCategory(String userid) async {
    print('calling api');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    // var a = Config.apiURL.toString();
    // var b = Config.getAllCategoryApi.toString();

    var ur = "${Config.apiURL}${Config.getAllCategoryApi}";
    // var ur = "${Config.apiURL}";
    // var ur = "localhist";
    // var ur = "127.0.0.1:8000/cateory";
    var url = Uri.parse(ur);

    print('ur is $ur');
    print('store id is: $userid');

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({"storeId": userid}),
    );

    print('after response');

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      print('data is $data');
      return categoiesFromJson(data['data']);
    } else {

      print('error h bhaiiiiiiiiiiiiii');
      return [];
    }
  }
}

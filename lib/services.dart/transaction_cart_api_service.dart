import 'dart:convert';
import 'package:gbim/models/product/product.dart';
import 'package:gbim/models/transaction/transaction.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config.dart';
import '../models/cart/cartitem.dart';
import '../models/order/orders.dart';

final transactioncartApiService =
    Provider((ref) => APIServiceTransactionCart());

class APIServiceTransactionCart {
  static var client = http.Client();

  Future<String> placetransaction(Map<String, dynamic> mp) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    String categId = mp['categId'];
    List<CartItem> productList = mp['cartList'];

    List<Map<String, dynamic>> cartList = [];
    for (int i = 0; i < productList.length; i++) {
      String productId = productList[i].Item.productId;
      double qty = productList[i].ItemCount;
      Map<String, dynamic> temp = {'product': productId, 'quantity': qty};

      cartList.add(temp);
    }

    var ur = "${Config.apiURL}${Config.placeTransaction}";
    var url = Uri.parse(ur);

    print('url is: $url');

    print(categId);
    print(cartList);

    var response = await client.post(url,
        headers: requestHeaders,
        body: jsonEncode({'categId': categId, 'list': cartList}));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return data['message'];
    } else {
      return 'failure';
    }
  }

  Future<List<Transactions>> fetchYourTransactions(String categId) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var ur = "${Config.apiURL}${Config.fetchTransaction}";
    var url = Uri.parse(ur);

    print('url is: $url');

    print(categId);

    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode({'categId': categId}));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return transactionsFromJson(data['data']);
    } else {
      return [];
    }
  }

  Future<Transactions> transactiondetailProvider(String transactionId) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var ur = "${Config.apiURL}${Config.fetchtransactiondetail}";
    var url = Uri.parse(ur);

    print('url is: $url');

    print(transactionId);

    var response = await client.post(url,
        headers: requestHeaders,
        body: jsonEncode({'transactionId': transactionId}));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return Transactions.fromJson(data['data']);
    } else {
      return Transactions(
          transactionDate: DateTime(DateTime.april),
          productsItem: [],
          transactionId: '');
    }
  }
}

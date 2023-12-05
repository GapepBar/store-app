import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gbim/models/cart/cartitem.dart';

import '../models/product/product.dart';
import '../providers/providers.dart';

class PreviewOrderScreen extends ConsumerStatefulWidget {
  const PreviewOrderScreen({super.key});

  @override
  ConsumerState<PreviewOrderScreen> createState() => _PreviewOrderScreenState();
}

class _PreviewOrderScreenState extends ConsumerState<PreviewOrderScreen> {
  Widget _buildProductList(
      BuildContext context, double scHeight, double scWidth) {
    final CartItemModel = ref.watch(orderCartItemsProvider);

    List<CartItem> previewProducts = CartItemModel.ordercartModel!.products;

    return allproductlistbuilder(previewProducts, context, scHeight, scWidth);
  }

  Widget allproductlistbuilder(List<CartItem> list, BuildContext context,
      double scHeight, double scWidth) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(list[index], scWidth, context);
        });
  }

  Widget ProductCard(CartItem cartitem, double scWidth, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, bottom: 25),
      width: scWidth,
      height: 100,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(10),
          color: cartitem.Item.totalQuantity > cartitem.Item.lowQuantity
              ? Color.fromARGB(255, 33, 143, 37)
              : const Color.fromARGB(255, 194, 53, 43)),
      child: Row(
        children: [
          Container(
              width: scWidth * 0.3,
              height: 100,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    cartitem.Item.imageUrl,
                    fit: BoxFit.cover,
                  ))),
          SizedBox(
            width: scWidth * 0.05,
          ),
          Container(
            width: scWidth * 0.3,
            padding: EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartitem.Item.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                ),
                Text(
                  cartitem.Item.totalQuantity.toString() +
                      ' ' +
                      cartitem.Item.quantityType,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            ),
          ),
          Spacer(),
          Container(
            child: Container(
              alignment: Alignment(0, 0),
              width: scWidth * 0.48 * 0.36,
              height: scWidth * 0.6 * 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Text(
                  cartitem.ItemCount.toString() +
                      ' ' +
                      cartitem.Item.quantityType,
                  textAlign: TextAlign.center),
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }

  void placeOrder(String categId) async {
    final CartItemModel = ref.watch(orderCartItemsProvider);
    List<CartItem> previewProducts = CartItemModel.ordercartModel!.products;

    Map<String, dynamic> mp = {"categId": categId, "cartList": previewProducts};

    final cartViewModel = ref.read(orderCartItemsProvider.notifier);
    String msg = await cartViewModel.placeOrder(mp);

    print('msg is :::: $msg');

    if (msg == 'success') {
      Navigator.of(context).pushNamed('/orderSuccessScreen');
    } else {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Some error occured')));
    }
  }

  @override
  Widget build(BuildContext context) {
    var dataMap = (ModalRoute.of(context)?.settings.arguments ??
        <String, String>{}) as Map;
    String categoryId = dataMap['categoryId'] ?? '';

    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;
    final scWidth = scSize.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Preview Order'),
      ),
      body: _buildProductList(context, scHeight, scWidth),
      bottomNavigationBar: GestureDetector(
        onTap: () => placeOrder(categoryId),
        child: Container(
          height: 60,
          alignment: Alignment(0, 0),
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          child: Text(
            'Place Order',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

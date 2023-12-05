import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gbim/models/product/product.dart';
import 'package:gbim/widgets/order/orderProductCard.dart';

import '../providers/providers.dart';

class OrderScreen extends ConsumerWidget {
  OrderScreen({super.key});

  List<Product> dummylist = [
    Product(
        productId: '1',
        name: 'Cheeni',
        description: 'good',
        imageUrl: '',
        lowQuantity: 5,
        quantityType: 'Kg',
        totalQuantity: 50),
    Product(
        productId: '2',
        name: 'Salt',
        description: 'good',
        imageUrl: '',
        lowQuantity: 5,
        quantityType: 'Kg',
        totalQuantity: 50),
    Product(
        productId: '3',
        name: 'Milk',
        description: 'good',
        imageUrl: '',
        lowQuantity: 5,
        quantityType: 'Kg',
        totalQuantity: 50),
    Product(
        productId: '4',
        name: 'jeera',
        description: 'good',
        imageUrl: '',
        lowQuantity: 5,
        quantityType: 'Kg',
        totalQuantity: 50),
    Product(
        productId: '5',
        name: 'ilaichi',
        description: 'good',
        imageUrl: '',
        lowQuantity: 5,
        quantityType: 'Kg',
        totalQuantity: 50),
    Product(
        productId: '6',
        name: 'soda',
        description: 'good',
        imageUrl: '',
        lowQuantity: 5,
        quantityType: 'Kg',
        totalQuantity: 3),
  ];

  Widget allproductList(WidgetRef ref, BuildContext context, String categoryId,
      double scHeight, double scWidth) {
    final allproducts = ref.watch(allproductlistProvider(categoryId));

    return allproducts.when(
      data: (list) {
        return allproductlistbuilder(list, context, scHeight, scWidth);
      },
      error: (_, __) => const Center(
        child: Text('Error'),
      ),
      loading: () => Center(child: const CircularProgressIndicator()),
    );

    // return allproductlistbuilder(dummylist, context, scHeight, scWidth);
  }

  Widget allproductlistbuilder(List<Product>? list, BuildContext context,
      double scHeight, double scWidth) {
    return list!.length == 0
        ? Center(
            child: Text('Empty List'),
          )
        : ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return OrderProductCard(
                product: list[index],
                key: Key(index.toString()),
              );
            });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var dataMap = (ModalRoute.of(context)?.settings.arguments ??
        <String, String>{}) as Map;
    String categoryId = dataMap['categoryId'] ?? '';

    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;
    final scWidth = scSize.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Order Screen'),
      ),
      body: allproductList(ref, context, categoryId, scHeight, scWidth),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          final cartViewModel = ref.read(orderCartItemsProvider.notifier);
          int val = cartViewModel.state.ordercartModel!.products.length;
          if (val == 0) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Cart is Empty')));
          } else {
            Navigator.of(context).pushNamed('/previewOrderScreen',
                arguments: {'categoryId': categoryId});
          }
        },
        child: Container(
          height: 60,
          alignment: Alignment(0, 0),
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          child: Text(
            'Preview Order',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

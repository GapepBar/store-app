import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gbim/models/product/product.dart';

import '../../providers/providers.dart';

class AllProducts extends ConsumerWidget {
  final categoryId;
  AllProducts({super.key, required this.categoryId});

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
        productId: '1',
        name: 'Salt',
        description: 'good',
        imageUrl: '',
        lowQuantity: 5,
        quantityType: 'Kg',
        totalQuantity: 50),
    Product(
        productId: '1',
        name: 'Milk',
        description: 'good',
        imageUrl: '',
        lowQuantity: 5,
        quantityType: 'Kg',
        totalQuantity: 50),
    Product(
        productId: '1',
        name: 'jeera',
        description: 'good',
        imageUrl: '',
        lowQuantity: 5,
        quantityType: 'Kg',
        totalQuantity: 50),
    Product(
        productId: '1',
        name: 'ilaichi',
        description: 'good',
        imageUrl: '',
        lowQuantity: 5,
        quantityType: 'Kg',
        totalQuantity: 50),
    Product(
        productId: '1',
        name: 'soda',
        description: 'good',
        imageUrl: '',
        lowQuantity: 5,
        quantityType: 'Kg',
        totalQuantity: 3),
  ];

  Widget allproductList(
      WidgetRef ref, BuildContext context, double scHeight, double scWidth) {
    final allproducts = ref.watch(allproductlistProvider(this.categoryId));

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
              return ProductCard(list[index], scWidth, context);
            });
  }

  Widget ProductCard(Product product, double scWidth, BuildContext context) {
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
          color: product.totalQuantity > product.lowQuantity
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
                    product.imageUrl,
                    fit: BoxFit.contain,
                  ))),
          SizedBox(
            width: scWidth * 0.05,
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  product.totalQuantity.toString() + ' ' + product.quantityType,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('category id: ${this.categoryId}');

    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;
    final scWidth = scSize.width;

    return allproductList(ref, context, scHeight, scWidth);
  }
}

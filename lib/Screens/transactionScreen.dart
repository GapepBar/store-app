import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gbim/models/product/product.dart';
import 'package:gbim/widgets/transaction/transactionProductCard.dart';

import '../providers/providers.dart';

class TransactionScreen extends ConsumerWidget {
  TransactionScreen({super.key});

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
              return TransactionProductCard(
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
        title: Text('Withdraw Screen'),
      ),
      body: allproductList(ref, context, categoryId, scHeight, scWidth),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          final cartViewModel = ref.read(transactionCartItemsProvider.notifier);
          int val = cartViewModel.state.transactioncartModel!.products.length;
          if (val == 0) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Cart is Empty')));
          } else {
            Navigator.of(context).pushNamed('/previewTransactionScreen',
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
            'Preview Withdraw',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

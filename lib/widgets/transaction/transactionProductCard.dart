import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gbim/models/product/product.dart';
import 'package:gbim/providers/providers.dart';

// ignore: must_be_immutable
class TransactionProductCard extends ConsumerStatefulWidget {
  late Product product;
  TransactionProductCard({super.key, required this.product});

  @override
  ConsumerState<TransactionProductCard> createState() =>
      _TransactionProductCardState(product: product);
}

class _TransactionProductCardState
    extends ConsumerState<TransactionProductCard> {
  Product product;
  _TransactionProductCardState({required this.product});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  double counter = 0;
  TextEditingController _textFieldController = TextEditingController();

  void editHandler() async {
    double? qtyVal = await showDialog<double>(
      context: context,
      builder: (context) => _displayDialogBox(context, product.quantityType),
    );
    print('Dialog one returned value ---> $qtyVal');

    setState(() {
      counter = qtyVal ?? 0.0;
    });

    if (qtyVal == 0.0) {
      deleteHandler();
    } else {
      final cartViewModel = ref.read(transactionCartItemsProvider.notifier);
      cartViewModel.updateCartItem(product.productId, qtyVal ?? 0);
    }
  }

  void deleteHandler() {
    print('delete tapped');
    setState(() {
      counter = 0;
    });
    final cartViewModel = ref.read(transactionCartItemsProvider.notifier);
    cartViewModel.removeCartItems(product.productId);
  }

  Widget addTile(scWidth) {
    final CartItemModel = ref.watch(transactionCartItemsProvider);

    if (CartItemModel.isLoading) {
      return SpinKitThreeInOut(
        size: 25,
        color: Theme.of(context).primaryColor,
      );
    }

    var searchdata = CartItemModel.transactioncartModel!.products;

    bool flag = false;
    for (int i = 0; i < searchdata.length; i++) {
      var data = searchdata[i];
      if (product.productId == data.Item.productId) {
        setState(() {
          counter = data.ItemCount;
        });
        flag = true;
        break;
      }
    }
    if (flag == false) {
      setState(() {
        counter = 0;
      });
    }

    // return Container();
    return buildAddTile(scWidth);
  }

  Widget buildAddTile(scWidth) {
    return counter != 0
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment(0, 0),
                width: scWidth * 0.48 * 0.36,
                height: scWidth * 0.6 * 0.20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Text(
                  '$counter' + ' ' + product.quantityType,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: Row(
                children: [
                  InkWell(
                    onTap: () => editHandler(),
                    child: Icon(
                      Icons.edit,
                      size: 22,
                      color: const Color.fromARGB(255, 173, 205, 231),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () => deleteHandler(),
                    child: Icon(
                      Icons.delete,
                      size: 22,
                      color: Color.fromARGB(255, 220, 119, 111),
                    ),
                  ),
                ],
              ))
            ],
          )
        : Container(
            alignment: Alignment(0, 0),
            width: scWidth * 0.48 * 0.36,
            height: scWidth * 0.48 * 0.20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: GestureDetector(
                onTap: () async {
                  double? qtyVal = await showDialog<double>(
                    context: context,
                    builder: (context) =>
                        _displayDialogBox(context, product.quantityType),
                  );
                  print('Dialog one returned value ---> $qtyVal');

                  setState(() {
                    counter = qtyVal ?? 0.0;
                  });

                  if (qtyVal != 0.0) {
                    final cartViewModel =
                        ref.read(transactionCartItemsProvider.notifier);
                    cartViewModel.addCartItems(product, qtyVal ?? 0);
                  }
                },
                child: const Text('ADD')),
          );
  }

  Widget _displayDialogBox(BuildContext context, String qtyType) {
    return AlertDialog(
      title: Text('Fill the quantity'),
      content: Column(
        children: [
          TextField(
            controller: _textFieldController,
          ),
          SizedBox(height: 15),
          Text(qtyType)
        ],
      ),
      actions: <Widget>[
        MaterialButton(
          color: Colors.red,
          textColor: Colors.white,
          child: const Text('CANCEL'),
          onPressed: () {
            Navigator.pop(context, 0.0);
          },
        ),
        MaterialButton(
          color: Colors.green,
          textColor: Colors.white,
          child: const Text('OK'),
          onPressed: () {
            Navigator.pop(
                context, double.parse(_textFieldController.text.toString()));
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    // final scHeight = scSize.height;
    final scWidth = scSize.width;

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
                    fit: BoxFit.cover,
                  ))),
          SizedBox(
            width: scWidth * 0.05,
          ),
          Container(
            width: scWidth * 0.33,
            padding: EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.clip,
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
          ),
          Spacer(),
          Container(
            child: addTile(scWidth),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}

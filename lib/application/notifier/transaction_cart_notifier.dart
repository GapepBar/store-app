import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gbim/application/state/transaction_cart_state.dart';
import 'package:gbim/models/cart/cart.dart';
import 'package:gbim/models/cart/cartitem.dart';
import 'package:gbim/models/product/product.dart';

import '../../services.dart/transaction_cart_api_service.dart';

class TransactionCartNotifier extends StateNotifier<TransactionCartState> {
  final APIServiceTransactionCart _apiService;

  TransactionCartNotifier(this._apiService)
      : super(const TransactionCartState()) {
    getCartitems();
  }

  Future<void> getCartitems() async {
    state = state.copyWith(isLoading: true);

    var cartdata = state.transactioncartModel;
    if (cartdata == null) cartdata = Cart(products: []);

    state = state.copyWith(transactioncartModel: cartdata);
    state = state.copyWith(isLoading: false);
  }

  Future<void> addCartItems(Product product, double quantity) async {
    // await _apiService.addCartItem(number, productId);

    // state = state.copyWith(isLoading: true);

    // var productById = await _apiService.findProductbyId(productId);
    var newCartitem = CartItem(Item: product, ItemCount: quantity);

    // var cartdata = state.ordercartModel;
    // cartdata!.products.toList().add(newCartitem);

    // state = state.copyWith(ordercartModel: cartdata);
    // state = state.copyWith(isLoading: false);

    var updatedItems = state.transactioncartModel!.products.toList();
    updatedItems.add(newCartitem);

    Cart newcart = Cart(products: updatedItems);

    state = state.copyWith(transactioncartModel: newcart);

    // await getCartitems(number);
  }

  Future<void> removeCartItems(String productid) async {
    // await _apiService.removeCartItem(userid, productid);

    var isCartItemExist = state.transactioncartModel!.products
        .firstWhere((prd) => prd.Item.productId == productid);

    var updatedItems = state.transactioncartModel!.products.toList();

    updatedItems.remove(isCartItemExist);

    Cart newcart = Cart(products: updatedItems);

    state = state.copyWith(transactioncartModel: newcart);

    // await getCartitems();
  }

  Future<void> updateCartItem(String prductId, double qty) async {
    // await _apiService.updatecartitem(number, qty, prductId);

    var isCartItemExist = state.transactioncartModel!.products
        .firstWhere((prd) => prd.Item.productId == prductId);

    //created new instance of that product with updated quantity
    CartItem cartProduct = CartItem(Item: isCartItemExist.Item, ItemCount: qty);

    // udated the list
    var updatedItems = state.transactioncartModel!.products.toList();
    updatedItems.remove(isCartItemExist);
    updatedItems.add(cartProduct);

    //createing new cart instance with updated data
    Cart newcart = Cart(products: updatedItems);

    //updating the state
    state = state.copyWith(transactioncartModel: newcart);

    // await getCartitems(number);
  }

  Future<String> placeOrder(mp) async {
    String statusdata = await _apiService.placetransaction(mp);

    if (statusdata == 'success') {
      var updatedItems = state.transactioncartModel!.products.toList();

      updatedItems.clear();

      Cart newcart = Cart(products: updatedItems);

      state = state.copyWith(transactioncartModel: newcart);

      return 'success';
    } else {
      return 'Error';
    }
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gbim/application/notifier/order_cart_notifier.dart';
import 'package:gbim/application/notifier/transaction_cart_notifier.dart';
import 'package:gbim/application/state/order_cart_state.dart';
import 'package:gbim/application/state/transaction_cart_state.dart';
import 'package:gbim/models/order/orders.dart';
import 'package:gbim/models/product/product.dart';
import 'package:gbim/services.dart/order_cart_api_service.dart';
import 'package:gbim/services.dart/transaction_cart_api_service.dart';

import '../models/cart/cartitem.dart';
import '../models/category/category.dart';
import '../services.dart/auth_api_service.dart';
import '../services.dart/category_api_service.dart';
import '../services.dart/product_api_service.dart';

final orderCartItemsProvider =
    StateNotifierProvider.autoDispose<OrderCartNotifier, OrderCartState>(
  (ref) {
    return OrderCartNotifier(ref.watch(ordercartApiService));
  },
);

final transactionCartItemsProvider = StateNotifierProvider.autoDispose<
    TransactionCartNotifier, TransactionCartState>(
  (ref) {
    return TransactionCartNotifier(ref.watch(transactioncartApiService));
  },
);

final loginProvider =
    FutureProvider.autoDispose.family<String, Map<String, String>>(
  (ref, mp) {
    final apiRespository = ref.watch(authApiService);

    return apiRespository.login(mp);
  },
);

final categorylistProvider =
    FutureProvider.autoDispose.family<List<Category>?, String>(
  (ref, userid) {
    final apiRespository = ref.watch(categoryApiService);
    print('inside provider');

    return apiRespository.getCategory(userid);
  },
);

final allproductlistProvider =
    FutureProvider.autoDispose.family<List<Product>?, String>(
  (ref, categId) {
    final apiRespository = ref.watch(productApiService);

    return apiRespository.fetchallProducts(categId);
  },
);

final yourordersProvider =
    FutureProvider.autoDispose.family<List<Orders>, String>(
  (ref, categId) {
    final apiRespository = ref.watch(ordercartApiService);

    return apiRespository.fetchYourOrders(categId);
  },
);

final orderdetailProvider = FutureProvider.autoDispose.family<Orders, String>(
  (ref, orderId) {
    final apiRespository = ref.watch(ordercartApiService);

    return apiRespository.orderdetailProvider(orderId);
  },
);

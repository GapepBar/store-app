import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class Config {

  /* -------------------------------- app setup ------------------------------- */
  // ignore: constant_identifier_names
  static const String GrocApp = 'GrocApp';
  // static const String apiURL = '127.0.0.1:8000';
  // static const String apiURL = 'http://35.154.32.225:8000';
  // static const String apiURL = 'http://10.183.216.61:8000';
  // static const String apiURL = 'http://localhost:8000';
  // static const String apiURL = '127.0.0.1:8000';
  static const String apiURL = 'http://192.168.153.122:8000';
  // 127.0.0.1:8000
  // 192.168.1.16:8000
  // static const String apiURL =
  //     'https://i1fn4d1wa3.execute-api.ap-south-1.amazonaws.com/dev';

  /* -------------------------------------------------------------------------- */
  /*                               End Points                                   */
  /* -------------------------------------------------------------------------- */

  static Size scSize = WidgetsBinding.instance.window.physicalSize;
  static double scHeight =
      ui.window.physicalSize.height / ui.window.devicePixelRatio;
  static double scWidth =
      ui.window.physicalSize.width / ui.window.devicePixelRatio;
  

  /* ---------------------------------- AUth ---------------------------------- */
  static const String LoginAPI = '/Login';

  /* ---------------------------- Categories APi's ---------------------------- */

  static const String getAllmainCategoryApi = '/category/getallmaincategory';
  static const String getAllCategoryApi = '/category/getAllCategories';
  static const String getAllCategoryByMainCategory =
      '/category/getCategoryByMainCategory';

  /* ------------------------------ Products Api ------------------------------ */

  static const String getAllProductsbyCategory =
      '/product/getAllProductsByCatId';

  static const String placeOrder =
      '/order/createOrder';
  static const String fetchorders =
      '/order/getOrders';
  static const String fetchorderdetail =
      '/order/getOrderById';

  static const String placeTransaction =
      '/transaction/createTransaction';
  static const String fetchTransaction =
      '/transaction/getTransactions';
  static const String fetchtransactiondetail =
      '/transaction/getTransactionById';

  /* -------------------------------- Offer Api ------------------------------- */
  static const String getAllOffers = '/offer/getAllOffers';
  static const String updateOffer = '/offer/updateOffer';
  static const String checkOffer = '/offer/redeemOffer';
  static const String verifyOffer = '/offer/verifyReferral';

  /* ----------------------------- Subcription APi ---------------------------- */
  static const String getSubscriptionByUser =
      '/subscription/fetchSubscriptionByUser';
  static const String cancelSubscription =
      '/subscription/cancelSubscriptionByUser';
  static const String createSubscripiotn = '/subscription/createSubscription';
  static const String editSubscripiotn = '/subscription/editSubscriptionByUser';

  /* ---------------------------------- Quote --------------------------------- */
  static const String getQuote = '/quote/getQuote';
}

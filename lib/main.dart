import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gbim/Screens/categoryScreen.dart';
import 'package:gbim/Screens/orderSummaryScreen.dart';
import 'package:gbim/Screens/previewOrderScreen.dart';
import 'package:gbim/Screens/profileScreen.dart';
import 'package:gbim/Screens/transactionScreen.dart';
import 'package:gbim/Screens/yourOrders.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/homepageScreen.dart';
import 'Screens/loginScreen.dart';
import 'Screens/orderScreen.dart';
import 'Screens/orderSuccessScreen.dart';
import 'Screens/previewTransactionScreen.dart';
import 'Screens/transactionSuccessScreen.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
      // home: const IntroAnimationScreen(),
      // initialRoute: '/',
      routes: {
        '/homepage': (context) => HomepageScreen(),
        '/categoryScreen': (context) => CategoryScreen(),
        '/loginpage': (context) => const LoginScreen(),
        '/profilepage': (context) => const ProfileScreen(),
        '/orderpage': (context) => OrderScreen(),
        '/withdrawpage': (context) => TransactionScreen(),
        '/previewOrderScreen': (context) => PreviewOrderScreen(),
        '/previewTransactionScreen': (context) => PreviewTransactionScreen(),
        '/yourOrderScreen': (context) => YourOrders(),
        '/orderSuccessScreen': (context) => OrderSuccessScreen(),
        '/transactionSuccessScreen': (context) => TransactionSuccessScreen(),
        '/orderSummaryScreen': (context) => OrderSummaryScreen(),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = (prefs.getString('userId'));

    if (userId != null) {
      return '/category';
    } else {
      return '/loginScreen';
    }
  }

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //     future: checkFirstSeen(),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       } else {
    //         if (snapshot.data == '/loginScreen') {
    //           return const LoginScreen();
    //         } else {
    //           return CategoryScreen();
    //         }
    //       }
    //     });

    return CategoryScreen();
    // return LoginScreen();
  }
}

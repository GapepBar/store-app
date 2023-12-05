import 'package:flutter/material.dart';
import 'package:gbim/widgets/homepage/allProducts.dart';
import 'package:gbim/widgets/homepage/lowStockProducts.dart';

late var globalCategoryId = '';
late var globalCategory = '';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   var dataMap = (ModalRoute.of(context)?.settings.arguments ??
    //       <String, String>{}) as Map;
    //   setState(() {
    //     globalCategory = dataMap['category'] ?? '';
    //     globalCategoryId = dataMap['categoryId'] ?? '';
    //   });
    // });
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index <= 1) {
      setState(() {
        _selectedIndex = index;
      });
    } else if (index == 2) {
      Navigator.of(context)
          .pushNamed('/orderpage', arguments: {'categoryId': globalCategoryId});
    } else if (index == 3) {
      Navigator.of(context).pushNamed('/withdrawpage',
          arguments: {'categoryId': globalCategoryId});
    } else if (index == 4) {
      Navigator.of(context).pushNamed('/profilepage',
          arguments: {'categoryId': globalCategoryId});
    } else {
      // navigating stuff
    }
  }

  @override
  Widget build(BuildContext context) {
    var dataMap = (ModalRoute.of(context)?.settings.arguments ??
        <String, String>{}) as Map;
    String category = dataMap['category'] ?? '';
    String categoryId = dataMap['categoryId'] ?? '';

    print('categoty id inside homepage: $categoryId');

    setState(() {
      globalCategoryId = categoryId;
    });

    print('globalcategoty id inside homepage: $globalCategoryId');

    List<Widget> _widgetOptions = <Widget>[
      AllProducts(
        categoryId: globalCategoryId,
      ),
      LowStockProducts(
        categoryId: globalCategoryId,
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: _selectedIndex <= 1
          ? _widgetOptions.elementAt(_selectedIndex)
          : Center(
              child: Text('Inside Black Hole'),
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.all_inbox),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.add_alert_rounded),
            label: 'Low Stock',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.add_box_rounded),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.remove_circle),
            label: 'Withdraw',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.amber[800],
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}

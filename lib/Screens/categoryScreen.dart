import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/category/category.dart';
import '../providers/providers.dart';

class CategoryScreen extends ConsumerWidget {
  CategoryScreen({super.key});

  List<Category> dummylist = [
    Category(name: 'Rashan', categoryId: '1'),
    Category(name: 'Done', categoryId: '2'),
    Category(name: 'Sabzi', categoryId: '3')
  ];

  Widget maincategoryList(WidgetRef ref, String userId, BuildContext context,
      double scHeight, double scWidth) {
    print('inside frontend function');
    final categories = ref.watch(categorylistProvider(userId));

    return categories.when(
      data: (list) {
        return categorylistbuilder(list, context, scHeight, scWidth);
      },
      error: (_, __) => const Center(
        child: Text('Error'),
      ),
      loading: () => Center(child: const CircularProgressIndicator()),
    );

    // return categorylistbuilder(dummylist, context, scHeight, scWidth);
  }

  Widget categorylistbuilder(List<Category>? list, BuildContext context,
      double scHeight, double scWidth) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      padding: EdgeInsets.all(16),
      itemCount: list!.length,
      itemBuilder: (context, index) {
        return CategoryCard(list[index], scWidth, context);
      },
    );
  }

  Widget CategoryCard(Category categ, double scWidth, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/homepage', arguments: {
          "category": categ.name.toString(),
          "categoryId": categ.categoryId
        });
      },
      child: Container(
          width: scWidth * 0.4,
          height: 100,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), //color of shadow
                spreadRadius: 2, //spread radius
                blurRadius: 4, // blur radius
                offset: Offset(0, 2), // changes position of shadow
                //first paramerter of offset is left-right
                //second parameter is top to down
              )
            ],
            color: Colors.white,
            // image: DecorationImage(opacity: 0.6, fit: BoxFit.contain, image: NetworkImage('https://www.netmeds.com/images/product-v1/600x600/908435/sabka_rashan_combo_2_0_0.jpg'))
          ),
          child: Center(
              child: Text(
            categ.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ))),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var dataMap = (ModalRoute.of(context)?.settings.arguments ??
        <String, String>{}) as Map;
    String userid = dataMap['userid'] ?? 'gb1';

    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;
    final scWidth = scSize.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Gappebar'),
      ),
      body: Center(
        child: maincategoryList(ref, userid, context, scHeight, scWidth),
      ),
    );
  }
}

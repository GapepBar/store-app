// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../widgets/profile/content.dart';
import '../widgets/profile/copyrightSymbol.dart';
import '../widgets/profile/heading.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var dataMap = (ModalRoute.of(context)?.settings.arguments ??
        <String, String>{}) as Map;
    String categoryId = dataMap['categoryId'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(children: [
          HeadingSupport(),
          SizedBox(height: 10),
          Content(categoryId: categoryId),
          CopyRightSymbol(),
        ]),
      ),
    );
  }
}

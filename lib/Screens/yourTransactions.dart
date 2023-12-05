// ignore: file_names
// ignore_for_file: implementation_imports, file_names, duplicate_ignore, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gbim/models/transaction/transaction.dart';
import 'package:gbim/widgets/yourTransaction/transactionItem.dart';
import '../providers/providers.dart';
import '../widgets/yourOrder/orderItem.dart';

class YourTransactions extends ConsumerStatefulWidget {
  const YourTransactions({super.key});

  @override
  _YourTransactionsState createState() => _YourTransactionsState();
}

class _YourTransactionsState extends ConsumerState<YourTransactions>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  bool islistempty = false;

  late final String orderID;
  late String totalAmount;
  late String date;
  late String address;
  late List<Map<String, dynamic>> orderDetails;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget transactionList(
      WidgetRef ref, BuildContext context, double scHeight, String categId) {
    final data = ref.watch(yourtransactionsProvider(categId));

    return data.when(
      data: (list) {
        if (list == null || list.isEmpty) islistempty = true;
        return transactionlistbuilder(list, context, scHeight);
      },
      error: (_, __) => Center(child: const Text('Error')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget transactionlistbuilder(List<Transactions> list, contex, scHeight) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final transaction = list[index];
        return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: _animationController,
              curve: Interval(index / list.length, 1.0, curve: Curves.easeOut),
            )),
            child: TransactionItem(
              transaction: transaction,
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var dataMap = (ModalRoute.of(context)?.settings.arguments ??
        <String, String>{}) as Map;
    String categoryId = dataMap['categoryId'] ?? '';

    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Transactions'),
        ),
        body: transactionList(ref, context, scHeight, categoryId));
  }
}

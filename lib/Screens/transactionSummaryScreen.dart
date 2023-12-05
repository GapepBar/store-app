// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gbim/models/transaction/transaction.dart';
import 'package:intl/intl.dart';

import '../providers/providers.dart';

class TransactionSummaryScreen extends ConsumerWidget {
  TransactionSummaryScreen({super.key});

  Widget transactionSummary(
      WidgetRef ref, BuildContext context, String transactionId) {
    final data = ref.watch(transactiondetailProvider(transactionId));

    return data.when(
      data: (transaction) {
        return transactionDetail(transaction);
      },
      error: (_, __) => Center(child: const Text('Error')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget transactionDetail(Transactions transaction) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* ------------------------- Order Summary Container ------------------------ */
            /* -------------------------------------------------------------------------- */
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  boxShadow: const [BoxShadow(blurRadius: 1, spreadRadius: 0)],
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Transaction Summary",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.symmetric(vertical: 8),
                    child: Text(
                      "${transaction.productsItem.length} items in this transaction",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                  ),

                  /* --------------------------- List tile for item --------------------------- */
                  Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          return ListTile(
                            leading: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              child: Image.network(transaction.productsItem[i]
                                  ['product']['imageUrl']),
                            ),
                            title: Text(
                                transaction.productsItem[i]['product']['name']),
                            subtitle: Text(
                                "${transaction.productsItem[i]['quantity'].toString()} ${transaction.productsItem[i]['product']['quantityType'].toString()}"),
                          );
                        },
                        itemCount: transaction.productsItem.length,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            /* ----------------------------- Upper container ---------------------------- */
            SizedBox(height: 20),

            /* ----------------------- Container For Order Details ---------------------- */
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  boxShadow: const [BoxShadow(blurRadius: 1, spreadRadius: 0)],
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Transaction Details",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  Divider(
                    thickness: 1,
                    color: Color.fromARGB(255, 241, 237, 237),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Transaction id",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(255, 137, 137, 137)),
                      ),
                      Text("${transaction.transactionId}"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Transaction placed",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(255, 137, 137, 137)),
                      ),
                      Text(
                          "Placed on ${DateFormat('yyyy-MM-dd').format(transaction.transactionDate)} at ${DateFormat('hh:mm:ss').format(transaction.transactionDate)}"),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var transactionData = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    String transactionId = transactionData['transactionId'];

    return Scaffold(
        appBar: AppBar(
          title: Text('Transaction Summary'),
        ),
        body: transactionSummary(ref, context, transactionId));
  }
}

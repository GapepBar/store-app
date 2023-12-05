// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gbim/models/transaction/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  Transactions transaction;

  TransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: ListTile(
        onTap: () {
          Navigator.of(context).pushNamed('/transactionSummaryScreen',
              arguments: {'transactionId': transaction.transactionId});
        },
        leading: CircleAvatar(
          radius: 22,
          backgroundColor: Colors.grey[200],
          child: const ClipOval(
              child: Image(
                  image: CachedNetworkImageProvider(
                      'https://img.freepik.com/free-vector/delivery-service-illustrated_23-2148505081.jpg?w=2000'),
                  fit: BoxFit.contain)),
        ),
        title:
            Text('Transaction Id: ${transaction.transactionId.toUpperCase()}'),
        subtitle: Container(
          margin: const EdgeInsets.only(top: 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMd().format(transaction.transactionDate),
                style: const TextStyle(fontSize: 11),
              ),
            ],
          ),
        ),
        trailing: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.navigate_next),
          ],
        ),
        tileColor: Colors.white,
        minVerticalPadding: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

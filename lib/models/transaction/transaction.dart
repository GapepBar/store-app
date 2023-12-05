// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
part 'transaction.freezed.dart';
part 'transaction.g.dart';

List<Transactions> transactionsFromJson(dynamic str) =>
    List<Transactions>.from((str).map((e) => Transactions.fromJson(e)));

@freezed
abstract class Transactions with _$Transactions {
  factory Transactions(
      {required String transactionId,
      required DateTime transactionDate,
      required List<Map<String, dynamic>> productsItem}) = _Transactions;

  factory Transactions.fromJson(Map<String, dynamic> json) => _$TransactionsFromJson(json);
}

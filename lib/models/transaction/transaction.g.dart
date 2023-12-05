// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionsImpl _$$TransactionsImplFromJson(Map<String, dynamic> json) =>
    _$TransactionsImpl(
      transactionId: json['transactionId'] as String,
      transactionDate: DateTime.parse(json['transactionDate'] as String),
      productsItem: (json['productsItem'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$TransactionsImplToJson(_$TransactionsImpl instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'transactionDate': instance.transactionDate.toIso8601String(),
      'productsItem': instance.productsItem,
    };

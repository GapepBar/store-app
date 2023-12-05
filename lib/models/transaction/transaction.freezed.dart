// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Transactions _$TransactionsFromJson(Map<String, dynamic> json) {
  return _Transactions.fromJson(json);
}

/// @nodoc
mixin _$Transactions {
  String get transactionId => throw _privateConstructorUsedError;
  DateTime get transactionDate => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get productsItem =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionsCopyWith<Transactions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionsCopyWith<$Res> {
  factory $TransactionsCopyWith(
          Transactions value, $Res Function(Transactions) then) =
      _$TransactionsCopyWithImpl<$Res, Transactions>;
  @useResult
  $Res call(
      {String transactionId,
      DateTime transactionDate,
      List<Map<String, dynamic>> productsItem});
}

/// @nodoc
class _$TransactionsCopyWithImpl<$Res, $Val extends Transactions>
    implements $TransactionsCopyWith<$Res> {
  _$TransactionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? transactionDate = null,
    Object? productsItem = null,
  }) {
    return _then(_value.copyWith(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      productsItem: null == productsItem
          ? _value.productsItem
          : productsItem // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionsImplCopyWith<$Res>
    implements $TransactionsCopyWith<$Res> {
  factory _$$TransactionsImplCopyWith(
          _$TransactionsImpl value, $Res Function(_$TransactionsImpl) then) =
      __$$TransactionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String transactionId,
      DateTime transactionDate,
      List<Map<String, dynamic>> productsItem});
}

/// @nodoc
class __$$TransactionsImplCopyWithImpl<$Res>
    extends _$TransactionsCopyWithImpl<$Res, _$TransactionsImpl>
    implements _$$TransactionsImplCopyWith<$Res> {
  __$$TransactionsImplCopyWithImpl(
      _$TransactionsImpl _value, $Res Function(_$TransactionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? transactionDate = null,
    Object? productsItem = null,
  }) {
    return _then(_$TransactionsImpl(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      productsItem: null == productsItem
          ? _value._productsItem
          : productsItem // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionsImpl implements _Transactions {
  _$TransactionsImpl(
      {required this.transactionId,
      required this.transactionDate,
      required final List<Map<String, dynamic>> productsItem})
      : _productsItem = productsItem;

  factory _$TransactionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionsImplFromJson(json);

  @override
  final String transactionId;
  @override
  final DateTime transactionDate;
  final List<Map<String, dynamic>> _productsItem;
  @override
  List<Map<String, dynamic>> get productsItem {
    if (_productsItem is EqualUnmodifiableListView) return _productsItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productsItem);
  }

  @override
  String toString() {
    return 'Transactions(transactionId: $transactionId, transactionDate: $transactionDate, productsItem: $productsItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionsImpl &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            const DeepCollectionEquality()
                .equals(other._productsItem, _productsItem));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, transactionId, transactionDate,
      const DeepCollectionEquality().hash(_productsItem));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionsImplCopyWith<_$TransactionsImpl> get copyWith =>
      __$$TransactionsImplCopyWithImpl<_$TransactionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionsImplToJson(
      this,
    );
  }
}

abstract class _Transactions implements Transactions {
  factory _Transactions(
          {required final String transactionId,
          required final DateTime transactionDate,
          required final List<Map<String, dynamic>> productsItem}) =
      _$TransactionsImpl;

  factory _Transactions.fromJson(Map<String, dynamic> json) =
      _$TransactionsImpl.fromJson;

  @override
  String get transactionId;
  @override
  DateTime get transactionDate;
  @override
  List<Map<String, dynamic>> get productsItem;
  @override
  @JsonKey(ignore: true)
  _$$TransactionsImplCopyWith<_$TransactionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

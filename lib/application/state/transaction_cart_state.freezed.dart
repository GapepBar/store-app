// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransactionCartState {
  Cart? get transactioncartModel => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionCartStateCopyWith<TransactionCartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCartStateCopyWith<$Res> {
  factory $TransactionCartStateCopyWith(TransactionCartState value,
          $Res Function(TransactionCartState) then) =
      _$TransactionCartStateCopyWithImpl<$Res, TransactionCartState>;
  @useResult
  $Res call({Cart? transactioncartModel, bool isLoading});

  $CartCopyWith<$Res>? get transactioncartModel;
}

/// @nodoc
class _$TransactionCartStateCopyWithImpl<$Res,
        $Val extends TransactionCartState>
    implements $TransactionCartStateCopyWith<$Res> {
  _$TransactionCartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactioncartModel = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      transactioncartModel: freezed == transactioncartModel
          ? _value.transactioncartModel
          : transactioncartModel // ignore: cast_nullable_to_non_nullable
              as Cart?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CartCopyWith<$Res>? get transactioncartModel {
    if (_value.transactioncartModel == null) {
      return null;
    }

    return $CartCopyWith<$Res>(_value.transactioncartModel!, (value) {
      return _then(_value.copyWith(transactioncartModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionCartStateImplCopyWith<$Res>
    implements $TransactionCartStateCopyWith<$Res> {
  factory _$$TransactionCartStateImplCopyWith(_$TransactionCartStateImpl value,
          $Res Function(_$TransactionCartStateImpl) then) =
      __$$TransactionCartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Cart? transactioncartModel, bool isLoading});

  @override
  $CartCopyWith<$Res>? get transactioncartModel;
}

/// @nodoc
class __$$TransactionCartStateImplCopyWithImpl<$Res>
    extends _$TransactionCartStateCopyWithImpl<$Res, _$TransactionCartStateImpl>
    implements _$$TransactionCartStateImplCopyWith<$Res> {
  __$$TransactionCartStateImplCopyWithImpl(_$TransactionCartStateImpl _value,
      $Res Function(_$TransactionCartStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactioncartModel = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$TransactionCartStateImpl(
      transactioncartModel: freezed == transactioncartModel
          ? _value.transactioncartModel
          : transactioncartModel // ignore: cast_nullable_to_non_nullable
              as Cart?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TransactionCartStateImpl implements _TransactionCartState {
  const _$TransactionCartStateImpl(
      {this.transactioncartModel, this.isLoading = false});

  @override
  final Cart? transactioncartModel;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'TransactionCartState(transactioncartModel: $transactioncartModel, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionCartStateImpl &&
            (identical(other.transactioncartModel, transactioncartModel) ||
                other.transactioncartModel == transactioncartModel) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transactioncartModel, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionCartStateImplCopyWith<_$TransactionCartStateImpl>
      get copyWith =>
          __$$TransactionCartStateImplCopyWithImpl<_$TransactionCartStateImpl>(
              this, _$identity);
}

abstract class _TransactionCartState implements TransactionCartState {
  const factory _TransactionCartState(
      {final Cart? transactioncartModel,
      final bool isLoading}) = _$TransactionCartStateImpl;

  @override
  Cart? get transactioncartModel;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$TransactionCartStateImplCopyWith<_$TransactionCartStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderCartState {
  Cart? get ordercartModel => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderCartStateCopyWith<OrderCartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCartStateCopyWith<$Res> {
  factory $OrderCartStateCopyWith(
          OrderCartState value, $Res Function(OrderCartState) then) =
      _$OrderCartStateCopyWithImpl<$Res, OrderCartState>;
  @useResult
  $Res call({Cart? ordercartModel, bool isLoading});

  $CartCopyWith<$Res>? get ordercartModel;
}

/// @nodoc
class _$OrderCartStateCopyWithImpl<$Res, $Val extends OrderCartState>
    implements $OrderCartStateCopyWith<$Res> {
  _$OrderCartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ordercartModel = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      ordercartModel: freezed == ordercartModel
          ? _value.ordercartModel
          : ordercartModel // ignore: cast_nullable_to_non_nullable
              as Cart?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CartCopyWith<$Res>? get ordercartModel {
    if (_value.ordercartModel == null) {
      return null;
    }

    return $CartCopyWith<$Res>(_value.ordercartModel!, (value) {
      return _then(_value.copyWith(ordercartModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderCartStateImplCopyWith<$Res>
    implements $OrderCartStateCopyWith<$Res> {
  factory _$$OrderCartStateImplCopyWith(_$OrderCartStateImpl value,
          $Res Function(_$OrderCartStateImpl) then) =
      __$$OrderCartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Cart? ordercartModel, bool isLoading});

  @override
  $CartCopyWith<$Res>? get ordercartModel;
}

/// @nodoc
class __$$OrderCartStateImplCopyWithImpl<$Res>
    extends _$OrderCartStateCopyWithImpl<$Res, _$OrderCartStateImpl>
    implements _$$OrderCartStateImplCopyWith<$Res> {
  __$$OrderCartStateImplCopyWithImpl(
      _$OrderCartStateImpl _value, $Res Function(_$OrderCartStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ordercartModel = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$OrderCartStateImpl(
      ordercartModel: freezed == ordercartModel
          ? _value.ordercartModel
          : ordercartModel // ignore: cast_nullable_to_non_nullable
              as Cart?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$OrderCartStateImpl implements _OrderCartState {
  const _$OrderCartStateImpl({this.ordercartModel, this.isLoading = false});

  @override
  final Cart? ordercartModel;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'OrderCartState(ordercartModel: $ordercartModel, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderCartStateImpl &&
            (identical(other.ordercartModel, ordercartModel) ||
                other.ordercartModel == ordercartModel) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ordercartModel, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderCartStateImplCopyWith<_$OrderCartStateImpl> get copyWith =>
      __$$OrderCartStateImplCopyWithImpl<_$OrderCartStateImpl>(
          this, _$identity);
}

abstract class _OrderCartState implements OrderCartState {
  const factory _OrderCartState(
      {final Cart? ordercartModel,
      final bool isLoading}) = _$OrderCartStateImpl;

  @override
  Cart? get ordercartModel;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$OrderCartStateImplCopyWith<_$OrderCartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

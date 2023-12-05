import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/cart/cart.dart';

part 'order_cart_state.freezed.dart';

@freezed
class OrderCartState with _$OrderCartState {
  const factory OrderCartState({
    Cart? ordercartModel,
    @Default(false) bool isLoading,
  }) = _OrderCartState;
}

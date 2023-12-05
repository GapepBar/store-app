import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/cart/cart.dart';

part 'transaction_cart_state.freezed.dart';

@freezed
class TransactionCartState with _$TransactionCartState {
  const factory TransactionCartState({
    Cart? transactioncartModel,
    @Default(false) bool isLoading,
  }) = _TransactionCartState;
}

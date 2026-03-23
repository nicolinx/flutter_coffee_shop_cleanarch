import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coffee_shop_cleanarch/features/checkout/bloc/checkout_event.dart';
import 'package:flutter_coffee_shop_cleanarch/features/checkout/bloc/checkout_state.dart';
import 'package:flutter_coffee_shop_cleanarch/features/checkout/managers/checkout_manager.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CheckoutManager _manager;

  CheckoutBloc(this._manager) : super(CheckoutInitial()) {
    on<ConfirmPaymentPressed>((event, emit) async {
      emit(CheckoutLoading());
      try {
        await _manager.checkout();
        emit(CheckoutSuccess());
      } catch (e) {
        emit(CheckoutFailure(e.toString()));
      }
    });
  }
}

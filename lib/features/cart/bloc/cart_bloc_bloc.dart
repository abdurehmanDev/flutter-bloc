import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/cart_list.dart';
import '../../home/models/home_product_data_model.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBlocBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartBlocBloc() : super(CartBlocInitial()) {
   on<CartInitialEvent>(cartInitialEvent);

   on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);


  }
  
  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartBlocState> emit) {
      //on state listener emit method
        emit(CartSuccessState(cartListItems: cartListItems));
  }

// this method is for removing the cart item from cart list 
  FutureOr<void> cartRemoveFromCartEvent(CartRemoveFromCartEvent event, Emitter<CartBlocState> emit) {
    //steps
    // get cartItems
    // check in our product model there is item or not
    // run the function to remove that product
    // emit cartItemRemovedState

    cartListItems.remove(event.productDataModel);

    emit(CartSuccessState(cartListItems: cartListItems));

    emit(CartRemoveActionState());

  }


}

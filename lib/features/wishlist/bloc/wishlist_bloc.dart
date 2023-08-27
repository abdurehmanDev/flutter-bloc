import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:Bloc_PUC/data/wishlist.dart';
import 'package:Bloc_PUC/features/home/models/home_product_data_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
  on<WishlistInitialEvent>(wishlistInitialEvent);

  on<WishlistRemoveFromWishListEvent>(wishlistRemoveFromWishListEvent);
  }

  FutureOr<void> wishlistInitialEvent(WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishListItems: wishListItems));
  
  }

  FutureOr<void> wishlistRemoveFromWishListEvent(WishlistRemoveFromWishListEvent event, Emitter<WishlistState> emit) {
    wishListItems.remove(event.productDataModel);

    emit(WishlistSuccessState(wishListItems: wishListItems));

    emit(WishlistRemoveActionState());
  }
}

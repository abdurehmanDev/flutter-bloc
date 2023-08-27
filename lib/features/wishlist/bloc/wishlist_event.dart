part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class WishlistRemoveFromWishListEvent extends WishlistEvent {
  final ProductDataModel productDataModel;

  WishlistRemoveFromWishListEvent({
   required this.productDataModel
});
}

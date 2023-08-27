part of 'cart_bloc_bloc.dart';

@immutable
abstract class CartBlocState {}

abstract class CartActionState extends CartBlocState {}

 class CartBlocInitial extends CartBlocState {}

class CartSuccessState extends CartBlocState {
    final List<ProductDataModel> cartListItems;

  CartSuccessState({
   required this.cartListItems
});
}

class CartRemoveActionState extends CartActionState {}


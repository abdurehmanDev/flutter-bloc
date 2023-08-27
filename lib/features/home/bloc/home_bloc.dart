import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:Bloc_PUC/data/cart_list.dart';
import 'package:Bloc_PUC/data/grocery_data.dart';
import 'package:Bloc_PUC/data/wishlist.dart';
import 'package:Bloc_PUC/features/home/models/home_product_data_model.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    // initial event 
    on<HomeInitialEvent>(homeInitialEvent);
//for product
      on<HomeProductWishlistButtonClickedEvent>(homeProductWishlistButtonClickedEvent);

      on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
// for navigate
      on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);

      on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);

  }
// inital event method
    FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async{
     emit(HomeLoadingState());

     //get method for data getting
     await Future.delayed(Duration(seconds: 3));
     emit(HomeLoadedSuccessState(products: 

     // grocery data bind to product data model
     GroceryData.groceryProducts.map((e) => 
     ProductDataModel(id: e['id'], name: e['name'], description: e['description'], imageUrl: e['imageUrl'], price: e['price'])
     ).toList()
     
     ));
  }



// method for the product event
  FutureOr<void> homeProductWishlistButtonClickedEvent(HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print("wishlist product clicked");
    // this is emitted then it listen to home widget
    emit(HomeProductWishtedActionState());
    //add the items to the list wishListItems
    wishListItems.add(event.clickedProduct);
  }
    //no way to pass cart list data in this bloc so, we pass from home event
  FutureOr<void> homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
  //this is emitted then it listen to home widget
   emit(HomeProductCartedActionState());
   //add the items to the list cartListItems
    cartListItems.add(event.clickedProduct);
    print("Cart product clicked");
  }


// for navigate event
  FutureOr<void> homeCartButtonNavigateEvent(HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {

    print("Cart navigate clicked");
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
     print("wishlist navigate clicked");
     emit(HomeNavigateToWishListPageActionState());
  }


}   
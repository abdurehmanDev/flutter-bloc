import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Bloc_PUC/features/cart/ui/cart_tile_widget.dart';
import '../bloc/cart_bloc_bloc.dart';

class Cart extends StatefulWidget {

  const Cart({ Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBlocBloc cartBloc = CartBlocBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                  backgroundColor: Colors.teal,
        title: Text("Cart Items"),
      ),
      body: BlocConsumer<CartBlocBloc, CartBlocState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is !CartActionState,
         listener: (context, state) {
          if (state is CartRemoveActionState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item removed')));
          }
         },
         builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
            final successState = state as CartSuccessState;
          return  ListView.builder(
                  itemCount: successState.cartListItems.length,
                  itemBuilder: (context, index) {
                    return CartTileWidget(
                        cartBloc: cartBloc,
                        productDataModel: successState.cartListItems[index]);
                  });
        
          }
                  return  Container();
                 },
         ),
    );
  }

}
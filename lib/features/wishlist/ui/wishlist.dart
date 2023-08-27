import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Bloc_PUC/features/wishlist/ui/wishlist_tile_widget.dart';
import '../bloc/wishlist_bloc.dart';

class wishlist extends StatefulWidget {

  const wishlist({ Key? key}) : super(key: key);

  @override
  _wishlistState createState() => _wishlistState();
}

class _wishlistState extends State<wishlist> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                  backgroundColor: Colors.teal,
        title: Text("wishlist Items"),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is !WishlistActionState,
         listener: (context, state) {
          if (state is WishlistRemoveActionState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item removed')));
          }
         },
         builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState:
            final successState = state as WishlistSuccessState;
          return  ListView.builder(
                  itemCount: successState.wishListItems.length,
                  itemBuilder: (context, index) {
                    return wishlistTileWidget(
                        wishlistBloc: wishlistBloc,
                        productDataModel: successState.wishListItems[index]);
                  });
        
          }
                  return  Container();
                 },
         ),
    );
  }

}
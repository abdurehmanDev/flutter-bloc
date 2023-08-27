import 'package:flutter/material.dart';
import 'package:Bloc_PUC/features/home/bloc/home_bloc.dart';
import 'package:Bloc_PUC/features/home/models/home_product_data_model.dart';

import '../bloc/cart_bloc_bloc.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBlocBloc cartBloc;
  const CartTileWidget({Key? key, required this.productDataModel, required this.cartBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productDataModel.imageUrl))),
          ),
          const SizedBox(height: 20),
          Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(productDataModel.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(productDataModel.description)), 
          Padding(
              padding: EdgeInsets.only(left: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$' + productDataModel.price.toString(),
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                      
                          },
                          icon: Icon(Icons.favorite_border_outlined)),
                      IconButton(
                          onPressed: () {
                             cartBloc.add(CartRemoveFromCartEvent(productDataModel: productDataModel));
                          },
                          icon: Icon(Icons.shopping_bag))
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}

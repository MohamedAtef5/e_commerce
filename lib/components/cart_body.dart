import 'package:e_commerce/Cubit/cubit.dart';
import 'package:e_commerce/components/cart_card.dart';
import 'package:flutter/material.dart';


class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      color:Colors.blueGrey,
      child: GridView.count(
            childAspectRatio: 0.7,
            crossAxisCount: 2,
            children: List.generate(HomeCubit.get(context).cartProducts.length, (index) {
              return CartCard(
                product: HomeCubit.get(context).cartProducts[index],
              );
            }),
          ),
    );
        }
        
}
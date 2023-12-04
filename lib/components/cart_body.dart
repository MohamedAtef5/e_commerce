import 'package:e_commerce/Cubit/cubit.dart';
import 'package:e_commerce/Cubit/states.dart';
import 'package:e_commerce/components/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          print(state);
          return GridView.count(
            childAspectRatio: 0.8,
            crossAxisCount: 2,
            children: List.generate(HomeCubit.get(context).cartProducts.length, (index) {
              return CartCard(
                product: HomeCubit.get(context).cartProducts[index],
              );
            }),
          );
        },
      ),
    );
  }
}

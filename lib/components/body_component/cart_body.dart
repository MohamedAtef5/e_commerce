import 'package:e_commerce/Cubit/cubit.dart';
import 'package:e_commerce/Cubit/states.dart';
import 'package:e_commerce/components/widget/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        if (HomeCubit.get(context).cartProducts.isNotEmpty) {
          return Container(
            color: const Color(0xffe5e5e5),
            child: GridView.count(
              childAspectRatio: 0.7,
              crossAxisCount: 2,
              children: List.generate(
                  HomeCubit.get(context).cartProducts.length, (index) {
                return CartCard(
                  product: HomeCubit.get(context).cartProducts[index],
                );
              }),
            ),
          );
        } else {
          return const Center(
            child: Text(
              "Nothing in cart!  ",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }
      },
    );
  }
}
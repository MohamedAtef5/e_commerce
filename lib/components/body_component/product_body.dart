import 'package:e_commerce/Cubit/cubit.dart';
import 'package:e_commerce/components/widget/products_card.dart';
import 'package:flutter/material.dart';

class ProductBody extends StatelessWidget {
 const  ProductBody({super.key});
  
  @override
  Widget build(BuildContext context) {

    List Products = HomeCubit.get(context).products;
    return Container(
      color: const Color(0xffe5e5e5),
      child: GridView.count(
        childAspectRatio: 0.7,
        crossAxisCount: 2,
        children: List.generate(Products.length, (index) {
          return  ProductCard(
            product: Products[index],
          );
        }),
      ),
    );
  }
}
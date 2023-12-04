import 'package:e_commerce/Cubit/cubit.dart';
import 'package:e_commerce/components/card.dart';
import 'package:flutter/material.dart';

class ProductBody extends StatelessWidget {
 const  ProductBody({super.key});
  
  @override
  Widget build(BuildContext context) {

    List Products = HomeCubit.get(context).products;
    return Container(
      color: Colors.blueGrey,
      child: GridView.count(
        childAspectRatio: 0.8,
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

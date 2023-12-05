import 'package:e_commerce/Cubit/cubit.dart';
import 'package:e_commerce/Cubit/states.dart';
import 'package:e_commerce/model/product_moduel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });
  final ProductModuel product;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeStates>(
      builder: (context, state) {
        return Card(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100 ,
                width: double.infinity,
                child: Image(
                  image: AssetImage(
                    product.image,
                  ),
                ),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                     
                    ),
                    child: Text(
                      "price :${product.price} ",
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                  
                    ),
                    child: Text(
                      "count :${product.count}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Add to cart ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    HomeCubit.get(context).addToCart(product);

                   
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(24, 24),
                    backgroundColor: const  Color(0xfffca311),
                  ),
                  child: const Icon(
                    Icons.add,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
      },
    );
  }
}

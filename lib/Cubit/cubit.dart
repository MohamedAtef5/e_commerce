import 'package:bloc/bloc.dart';
import 'package:e_commerce/Cubit/states.dart';
import 'package:e_commerce/components/cart_body.dart';
import 'package:e_commerce/components/product_body.dart';
import 'package:e_commerce/components/settings_body.dart';
import 'package:e_commerce/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(IntialState());
  static HomeCubit get(context) => BlocProvider.of(context);
  static double totalprice = 0;
  int currentIndex = 0;
  List<Text> totalpricesstate = [
    const Text(" "),
    Text(
      "Total Price: $totalprice",
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
    const Text(" ")
  ];

  List<Product> cartProducts = [];
  List<Product> products = [
    Product("Assets/Images/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg", 4, 200),
    Product("Assets/Images/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg", 5, 350),
    Product("Assets/Images/71li-ujtlUL._AC_UX679_.jpg", 1, 400),
    Product("Assets/Images/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg", 2, 300),
    Product("Assets/Images/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg", 9, 120),
    Product("Assets/Images/71YXzeOuslL._AC_UY879_.jpg", 4, 75),
    Product("Assets/Images/81fPKd-2AYL._AC_SL1500_.jpg", 3, 90),
  ];
  List<Widget> body = const [
    ProductBody(),
    CartBody(),
    SettingsBody(),
  ];
  List<String> title = const [
    'Products ',
    'Cart ',
    'Settings ',
  ];
  List<bool> centerTitle = [
    true,
    false,
    true,
  ];
  void tap(int index) {
    currentIndex = index;
    emit(TrastionState());
  }

  void addToCart(Product product) {
    if (!cartProducts.contains(product) && product.price != 0) {
      cartProducts.add(product);
      product.count--;
      totalprice += product.price;
      product.amount++;
    }
    emit(HomeGetDataSuccessState());
  }

  void setCount(Product product) {
    product.count--;
    emit(UbdateCount());
  }

  void updateTotal(Product product) {
    totalprice += product.price;
    emit(UbdateTotalPrice());
  }

  void addAmount(Product product) {
    if (product.count != 0) {
      totalprice += product.price;
      product.count--;
      product.amount++;
    }

    emit(HomeRemoveSeccessDataState());
  }

  void minusAmount(Product product) {
    if (product.amount > 0) {
      totalprice -= product.price;
      product.count++;
      product.amount--;
    }
    if (product.amount == 0){
      cartProducts.remove(product);
      emit(HomeRemoveSeccessDataState());
    }
    emit(HomeRemoveState());
  }

}

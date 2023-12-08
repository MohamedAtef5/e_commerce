import 'package:e_commerce/Cubit/states.dart';
import 'package:e_commerce/components/body_component/cart_body.dart';
import 'package:e_commerce/components/body_component/product_body.dart';
import 'package:e_commerce/components/body_component/settings_body.dart';
import 'package:e_commerce/data/remotly_data/api_helper.dart';
import 'package:e_commerce/model/product_moduel.dart';
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
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
    const Text(" ")
  ];

  List<ProductModuel> cartProducts = [];
  late List<ProductModuel> products ;
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
 
  void loadProducts()async{
    emit(HomeGetDataLoadingState());
    products = await ApiHelper.get().fetchDataFromAPI();
    if (products.isNotEmpty){
      emit(HomeGetDataSuccessState());

    }else {
      emit(HomeGetDataErrorState());
    }
  }
  void tap(int index) {
    currentIndex = index;
    emit(TrastionState());
  }

  void addToCart(ProductModuel product) {
    if (!cartProducts.contains(product) && product.price != 0) {
      cartProducts.add(product);
      product.count--;
      totalprice += product.price;
      product.amount++;
    }
    emit(HomeGetDataSuccessState());
  }

  void setCount(ProductModuel product) {
    product.count--;
    emit(UbdateCount());
  }

  void updateTotal(ProductModuel product) {
    totalprice += product.price;
    emit(UbdateTotalPrice());
  }

  void addAmount(ProductModuel product) {
    if (product.count != 0) {
      totalprice += product.price;
      product.count--;
      product.amount++;
    }

    emit(HomeRemoveSeccessDataState());
  }

  void minusAmount(ProductModuel product) {
    if (product.amount > 0) {
      totalprice -= product.price;
      product.count++;
      product.amount--;
    }
    if (product.amount == 0) {
      cartProducts.remove(product);
      emit(HomeRemoveSeccessDataState());
    }
    emit(HomeRemoveState());
  }

}
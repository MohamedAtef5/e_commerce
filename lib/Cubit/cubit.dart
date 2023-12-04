import 'package:bloc/bloc.dart';
import 'package:e_commerce/Cubit/states.dart';
import 'package:e_commerce/components/cart_body.dart';
import 'package:e_commerce/components/product_body.dart';
import 'package:e_commerce/components/settings_body.dart';
import 'package:e_commerce/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates>{
HomeCubit():super(IntialState());


static HomeCubit get(context) => BlocProvider.of(context);



List<Product>cartProducts=[];
  List<Product> products =   [
    Product("Assets/Images/1.jpg",4 , 200),
    Product("Assets/Images/1.jpg",5 , 350),
    Product("Assets/Images/1.jpg",1 , 400),
    Product("Assets/Images/1.jpg",2 , 300),
    Product("Assets/Images/1.jpg",9 , 120),
    Product("Assets/Images/1.jpg",4 , 75),
    Product("Assets/Images/1.jpg",3 , 90),
  ];
int currentIndex = 0 ;
List<Widget> body = const[
      ProductBody(),
      CartBody(),
      SettingsBody(),
    ];
List<String> title = const [
  'Products ',
  'Cart ',
  'Settings ',

];

void  tap (int index ){

   currentIndex = index ;
   emit(TrastionState());
}

void addToCart (Product product){
 cartProducts.add(product);
 print("emit");
  emit(HomeGetDataSuccessState());
}
void setCount (Product product){
  if (product.count > 0)product.count -- ;
  emit(UbdateCount());
}

}
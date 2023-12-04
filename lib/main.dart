import 'package:e_commerce/views/home_view.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const ECommerceApp());
}


class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
import 'package:e_commerce/Cubit/cubit.dart';
import 'package:e_commerce/Cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 209, 193, 193),
              title: Text(
                HomeCubit.get(context)
                    .title[HomeCubit.get(context).currentIndex],
              ),
              centerTitle: true,
            ),
            bottomNavigationBar: BottomNavigationBar(
              elevation: 200,
              type: BottomNavigationBarType.fixed,
              currentIndex: HomeCubit.get(context).currentIndex,
              onTap: (value) {
                HomeCubit.get(context).tap(value);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.list_alt_rounded,
                    ),
                    label: "products"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.production_quantity_limits,
                    ),
                    label: "cart"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings,
                    ),
                    label: "setting"),
              ],
            ),
            body: Center(
              child: HomeCubit.get(context)
                  .body[HomeCubit.get(context).currentIndex],
            ),
          );
        },
      ),
    );
  }
}

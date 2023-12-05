import 'package:e_commerce/Cubit/cubit.dart';
import 'package:e_commerce/Cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        if(state is IntialState){

        HomeCubit.get(context).loadProducts();
        }
        return Scaffold(
          appBar: AppBar(
            centerTitle: HomeCubit.get(context)
                .centerTitle[HomeCubit.get(context).currentIndex],
            backgroundColor: const Color(0xff14213d),
            title: Text(
              HomeCubit.get(context).title[HomeCubit.get(context).currentIndex],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: !HomeCubit.get(context)
                        .centerTitle[HomeCubit.get(context).currentIndex]
                    ? Text(
                        "Total Price: ${HomeCubit.totalprice} \$",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    : const Text(" "),
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: const Color(0xff14213d),
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
                    Icons.shopping_cart_outlined,
                  ),
                  label: "cart"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings_outlined,
                  ),
                  label: "setting"),
            ],
          ),
          body: Center(
            child: (state is IntialState)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                  
                : HomeCubit.get(context)
                    .body[HomeCubit.get(context).currentIndex],
          ),
        );
      },
    );
  }
}

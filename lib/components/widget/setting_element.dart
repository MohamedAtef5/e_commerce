import 'package:flutter/material.dart';

class SettingElement extends StatelessWidget {
   SettingElement({super.key, required this.icon, required this.txt});
  final Icon icon ;
  final String txt ;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 240, 235, 235),
          borderRadius: BorderRadius.circular(30)
        ),
        height: 50,
        
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              icon ,
              const Spacer(flex: 1,), 
              Text(txt,),
              const Spacer(flex: 4,),

            ],
          ),
        ),
      ),
    );
  }
}

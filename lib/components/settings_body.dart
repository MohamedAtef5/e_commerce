import 'package:e_commerce/components/setting_element.dart';
import 'package:flutter/material.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xfffafafa),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SettingElement(
              icon: const Icon(Icons.lock),
              txt: "Change Password",
              
            ),
            SettingElement(
              icon: const Icon(Icons.feedback),
              txt: "Feedback ",
              
            ),
            SettingElement(
              icon: const Icon(Icons.security),
              txt: "Privacy & security",
              
            )
          ],
        ),
      ),
    );
  }
}

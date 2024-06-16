import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_v2/env.dart';
import 'package:todo_v2/screens/settings_screen.dart';

class HomeProfile extends StatelessWidget {
  const HomeProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final localStorage = GetStorage();
    final user = localStorage.read('user');
    return GestureDetector(
      onTap: () {
        profileSettings(user);
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.00)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100.0),
          child: user['profile'].toString().isEmpty && user['profile'] == ""
              ? Image.asset(
                  "assets/images/profile.jpg",
                  fit: BoxFit.cover,
                  height: 40,
                  width: 40,
                )
              : Image.network(
                  AppEnvironment.profileBaseURL + user['profile'],
                  fit: BoxFit.cover,
                  height: 40,
                  width: 40,
                ),
        ),
      ),
    );
  }

  void profileSettings(final user) {
    Get.to(
      () => const SettingScreen(),
    );
  }
}

// ignore_for_file: dep

import 'package:flutter/material.dart';
import 'package:todo_v2/widgets/auth/auth_layout.dart';
import 'package:todo_v2/widgets/auth/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: const AuthLayout(
        child: RegisterForm(),
      ),
    );
  }
}

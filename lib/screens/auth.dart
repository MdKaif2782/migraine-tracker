import 'package:flutter/cupertino.dart';
import 'login.dart';
import 'register.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    // Logic to determine whether to show LoginScreen or RegisterScreen
    bool showLogin = true; // Replace with actual logic

    return showLogin ? const LoginScreen() : const RegisterScreen();
  }
}
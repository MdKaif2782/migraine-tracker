import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Perform login action
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
      // Save user to shared preferences
      Future<void> _saveUser() async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user', _emailController.text);
      }
      _saveUser();
      // Navigate to home screen
      Navigator.of(context).pushReplacement(
        CupertinoPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Login'),
      ),
      child: Center(
        child: Form(
          key: _formKey,
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CupertinoTextField(
                    controller: _emailController,
                    placeholder: 'Email',
                    padding: const EdgeInsets.all(16.0),
                  ),
                  const SizedBox(height: 16.0),
                  CupertinoTextField(
                    controller: _passwordController,
                    placeholder: 'Password',
                    padding: const EdgeInsets.all(16.0),
                    obscureText: true,
                  ),
                  const SizedBox(height: 16.0),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoButton.filled(
                      onPressed: _login,
                      child: const Text('Login'),
                    ),
                  ),
                ],
              ),
        )
        ),
      ),
    );
  }
}
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
    final double topMargin = MediaQuery.of(context).size.height * 0.1;
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Login'),
      ),
      child: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                margin: const EdgeInsets.only(bottom: 100.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: topMargin),
                    Container(
                      width: 100.0,
                      height: 100.0,
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/brainstorm.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 60),
                      child: const Text(
                        'Migraine Tracker',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    CupertinoTextField(
                      controller: _emailController,
                      placeholder: 'Email',
                      padding: const EdgeInsets.all(16.0),
                      placeholderStyle: const TextStyle(
                        color: CupertinoColors.systemGrey3,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: CupertinoColors.systemGrey,
                          width: 0.2,
                        ),
                        borderRadius: BorderRadius.circular(6),
                        color: CupertinoColors.white,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    CupertinoTextField(
                      controller: _passwordController,
                      placeholder: 'Password',
                      padding: const EdgeInsets.all(16.0),
                      obscureText: true,
                      placeholderStyle: const TextStyle(
                        color: CupertinoColors.systemGrey3,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: CupertinoColors.systemGrey,
                          width: 0.2,
                        ),
                        borderRadius: BorderRadius.circular(6),
                        color: CupertinoColors.white,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      width: double.infinity,
                      child: CupertinoButton.filled(
                        onPressed: _login,
                        child: const Text('Login', style: TextStyle(color: CupertinoColors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
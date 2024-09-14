// lib/main.dart
import 'package:flutter/cupertino.dart';
import 'package:migraine_tracker/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/login.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isNightMode = false;

  Future<bool> _checkUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('user');
  }

  void _toggleNightMode() {
    setState(() {
      _isNightMode = !_isNightMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: _isNightMode ? AppTheme.darkTheme : AppTheme.lightTheme,
      home: FutureBuilder<bool>(
        future: _checkUserLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CupertinoPageScaffold(
              child: Center(
                child: CupertinoActivityIndicator(),
              ),
            );
          } else {
            if (snapshot.data == true) {
              return const HomeScreen();
            } else {
              return const LoginScreen();
            }
          }
        },
      ),
    );
  }
}
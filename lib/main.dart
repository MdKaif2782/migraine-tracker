import 'package:flutter/cupertino.dart';
import 'package:migraine_tracker/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/login.dart'; // Make sure to import your login screen
import 'screens/home.dart'; // Make sure to import your home screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> _checkUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('user');
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: AppTheme.cupertinoTheme,
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
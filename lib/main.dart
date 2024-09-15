import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:migraine_tracker/screens/health.dart';
import 'package:migraine_tracker/screens/home.dart';
import 'package:migraine_tracker/screens/login.dart';
import 'package:migraine_tracker/screens/profile.dart';
import 'package:migraine_tracker/screens/register.dart';
import 'package:migraine_tracker/screens/report.dart';
import 'package:migraine_tracker/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/auth.dart';
import 'screens/app.dart';

void main() {
  // Set the status bar color
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: CupertinoColors.systemGrey, // Set the status bar color
    statusBarBrightness: Brightness.light, // Set the status bar brightness
    statusBarIconBrightness: Brightness.light, // Set the status bar icon brightness
  ));
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
      debugShowCheckedModeBanner: false,
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
              return const App();
            } else {
              return const Auth();
            }
          }
        },
      ),
    );
  }
}
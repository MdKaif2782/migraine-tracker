import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Home'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Welcome to the home screen!'),
            // Add a logout button
            const SizedBox(height: 20),
            CupertinoButton.filled(
              child: const Text('Logout'),
              onPressed: () {
                // Perform logout action
                // Remove user from shared preferences
                Future<void> removeUser() async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.remove('user');
                }
                removeUser();
                // Navigate to login screen
                Navigator.of(context).pushReplacement(
                  CupertinoPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
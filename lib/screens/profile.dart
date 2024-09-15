import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Center(
          child: CupertinoButton.filled(
            child: const Text('Logout', style: TextStyle(color: CupertinoColors.white)),
            onPressed: () {
              // Perform logout action
              // Remove user from shared preferences
              Future<void> removeUser() async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.remove('user');
              }

              removeUser();
              // Navigate to login screen
              Navigator.of(context, rootNavigator: true).pushAndRemoveUntil( CupertinoPageRoute(builder: (BuildContext context) { return const Auth(); }, ), (_) => false, );
            },
          ),
        )
    );
  }
}

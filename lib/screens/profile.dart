import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: CupertinoColors.darkBackgroundGray, // Set the status bar color to black
      statusBarBrightness: Brightness.dark, // Set the status bar brightness
      statusBarIconBrightness: Brightness.light, // Set the status bar icon brightness
    ));
  }

  //screen height
  double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: screenHeight(context) * 0.2,
                padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                decoration: const BoxDecoration(
                  color: CupertinoColors.darkBackgroundGray,
                  image: DecorationImage(
                    image: AssetImage('assets/images/doodle-mt.png'),
                    opacity: 0.3,
                    //white color filter,
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.notifications, size: 28,color: CupertinoColors.white,),
                        const Text('Profile', style: TextStyle(color: CupertinoColors.white, fontSize: 20)),
                        CupertinoButton(
                          onPressed: () {
                          Future<void> removeUser() async {
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.remove('user');
                          }
                          removeUser();
                          Navigator.of(context, rootNavigator: true).pushAndRemoveUntil( CupertinoPageRoute(builder: (BuildContext context) { return const Auth(); }, ), (_) => false, );
                        },
                        child: const Icon(Icons.logout, size: 28,color: CupertinoColors.white,)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),
            ]
          ),
        )
    );
  }
}
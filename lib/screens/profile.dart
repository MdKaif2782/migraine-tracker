import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //screen height
  double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          children: [
            ProfileHeader(screenHeight: screenHeight(context)),
            const ProfileImage(),
            const ProfileName(),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        const SizedBox(height: 20),
                        const ProfileDetails(),
                        const PersonalInformation(),
                        const PreferenceAndSettings(),
                        const SizedBox(height: 60),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final double screenHeight;

  const ProfileHeader({Key? key, required this.screenHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.2,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: const BoxDecoration(
        color: CupertinoColors.darkBackgroundGray,
        image: DecorationImage(
          image: AssetImage('assets/images/doodle-mt.png'),
          opacity: 0.3,
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.notifications,
                size: 28,
                color: CupertinoColors.white,
              ),
              const Text('Profile',
                  style: TextStyle(color: CupertinoColors.white, fontSize: 20)),
              CupertinoButton(
                  onPressed: () {
                    Future<void> removeUser() async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.remove('user');
                    }

                    removeUser();
                    Navigator.of(context, rootNavigator: true)
                        .pushAndRemoveUntil(
                      CupertinoPageRoute(
                        builder: (BuildContext context) {
                          return const Auth();
                        },
                      ),
                      (_) => false,
                    );
                  },
                  child: const Icon(
                    Icons.logout,
                    size: 28,
                    color: CupertinoColors.white,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -60),
      child: Container(
        width: MediaQuery.of(context).size.height * 0.17,
        height: MediaQuery.of(context).size.height * 0.17,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          border: Border.fromBorderSide(
            BorderSide(
              strokeAlign: BorderSide.strokeAlignOutside,
              color: CupertinoColors.systemGrey3,
              width: 5,
            ),
          ),
          image: DecorationImage(
            image: AssetImage("assets/images/avatar.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ProfileName extends StatelessWidget {
  const ProfileName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Transform.translate(
            offset: const Offset(0, -40),
            child: const Text('Ted Bundy',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500))),
        Transform.translate(
            offset: const Offset(0, -35),
            child: const Text('CSE, Jahangirnagar University',
                style: TextStyle(
                    fontSize: 16, color: CupertinoColors.systemGrey))),
        Transform.translate(
            offset: const Offset(0, -30),
            child: const Text('Dhaka, Bangladesh',
                style: TextStyle(
                    fontSize: 16, color: CupertinoColors.systemGrey))),
      ],
    );
  }
}

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -15),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 16),
        child: const Text("Personal Information",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: CupertinoColors.black)),
      ),
    );
  }
}

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -5),
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: CupertinoColors.systemGrey3,
        ),
        padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 4),
        child: const Row(
          children: [
            InfoColumn(
              icons: [
                Icons.calendar_month_rounded,
                Icons.email,
                Icons.call,
                Icons.timer_outlined,
              ],
            ),
            SizedBox(width: 20),
            InfoColumn(
              texts: ["Age:", "Email:", "Cell:", "Last Attacked:"],
            ),
            SizedBox(width: 20),
            InfoColumn(
              texts: ["30", "tedbundy@gm...", "+8801618070200", "3 days ago"],
            ),
          ],
        ),
      ),
    );
  }
}

class PreferenceAndSettings extends StatelessWidget {
  const PreferenceAndSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 16, bottom: 16, top: 16),
          child: const Text("Preference and Settings",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: CupertinoColors.black)),
        ),
        Transform.translate(
          offset: const Offset(0, -5),
          child: Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: CupertinoColors.systemGrey3,
            ),
            padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 4),
            child: const Row(
              children: [
                InfoColumn(
                  icons: [
                    Icons.settings,
                    Icons.notifications,
                    Icons.lock,
                    Icons.language,
                  ],
                ),
                SizedBox(width: 20),
                InfoColumn(
                  texts: ["Settings:", "Notifications:", "Privacy:", "Language:"],
                ),
                SizedBox(width: 20),
                InfoColumn(
                  texts: ["Enabled", "On", "High", "English"],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class InfoColumn extends StatelessWidget {
  final List<IconData>? icons;
  final List<String>? texts;

  const InfoColumn({Key? key, this.icons, this.texts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: icons != null
          ? icons!
              .map((icon) => Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Icon(icon, color: CupertinoColors.black, size: 20),
                  ))
              .toList()
          : texts!
              .map((text) => Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(text,
                        style: const TextStyle(
                            fontSize: 16,
                            color: CupertinoColors.black,
                            fontWeight: FontWeight.w500)),
                  ))
              .toList(),
    );
  }
}
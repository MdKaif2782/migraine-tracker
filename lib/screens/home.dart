import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
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
      child: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 50.0, left: 16.0, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const HomePageHeader(),

                const SizedBox(height: 40),

                const AttackBox(),
                const SizedBox(height: 28),
                const Text(
                    "  Last attack information",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                ),
                const SizedBox(height: 10),

                const LastAttackInfo(),
                const SizedBox(height: 28),
                const Text(
                  "  Pressure variation forecast",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                const PressureForecastBox(),


                const SizedBox(height: 28),

                CupertinoButton.filled(
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
        ]),
      ),
    );
  }
}

class LastAttackInfo extends StatelessWidget {
  const LastAttackInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey3.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Started at:',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '13:00, Jul 13',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        'End time:',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '19:00, Jul 13',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    'Duration',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '6 hours',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class AttackBox extends StatelessWidget {
  const AttackBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey3.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'You have been attack-free',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '3 days',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Container(
                width: 90.0,
                height: 90.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child:SvgPicture.asset(
                  'assets/svgs/happy_person.svg',
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              SvgPicture.asset(
                'assets/svgs/ic_share.svg',
                width: 20,
                height: 20,
                color: CupertinoColors.darkBackgroundGray,
              ),
              const SizedBox(width: 10),
              const Text(
                'Share your migraine diary',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '  Hi Ted Bundy!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '  Good morning!',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),

        Container(
          width: 40.0,
          height: 40.0,
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
              image: NetworkImage(
                  "https://s.abcnews.com/images/US/ted-bundy-1-ap-er-190213_hpMain_16x9_992.jpg?w=384"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

class PressureForecastBox extends StatelessWidget {
  const PressureForecastBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample data for the forecast
    final List<Map<String, dynamic>> forecastData = [
      {'day': 'Sun', 'date': 1, 'color': CupertinoColors.systemRed},
      {'day': 'Mon', 'date': 2, 'color': CupertinoColors.systemYellow},
      {'day': 'Tue', 'date': 3, 'color': CupertinoColors.systemGreen},
      {'day': 'Wed', 'date': 4, 'color': CupertinoColors.systemRed},
      {'day': 'Thu', 'date': 5, 'color': CupertinoColors.systemYellow},
      {'day': 'Fri', 'date': 6, 'color': CupertinoColors.systemGreen},
      {'day': 'Sat', 'date': 7, 'color': CupertinoColors.systemRed},
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey3.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: forecastData.map((data) {
              return Column(
                children: [
                  const SizedBox(height: 8),
                  Text(
                    data['day'],
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: data['color'],
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        data['date'].toString(),
                        style: const TextStyle(
                          color: CupertinoColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              SvgPicture.asset(
                'assets/svgs/ic_graph.svg', // Replace with your graph icon SVG path
                width: 22,
                height: 22,
                color: CupertinoColors.darkBackgroundGray,
              ),
              const SizedBox(width: 10),
              const Text(
                'View graphs',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

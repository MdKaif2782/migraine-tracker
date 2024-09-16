import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:migraine_tracker/screens/survey.dart';
import 'package:migraine_tracker/theme.dart';
import "package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart";
import 'home.dart';
import 'profile.dart';
import 'health.dart';
import 'report.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<Widget> _buildScreens() {

    return [
      const CupertinoApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: HomeScreen(),
      ),
      const CupertinoApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: HealthScreen(),
      ),
      const CupertinoApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: SurveyScreen(),
      ),
      const CupertinoApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: ReportScreen(),
      ),
      const CupertinoApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: ProfileScreen(),
      ),

    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    //get context
    final BuildContext appContext = context;
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        textStyle: const TextStyle(color: CupertinoColors.black, fontFamily: "Poppins"),
        activeColorPrimary: CupertinoColors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.heart),
        title: ("Health"),
        textStyle: const TextStyle(color: CupertinoColors.black, fontFamily: "Poppins"),
        activeColorPrimary: CupertinoColors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.add, color: CupertinoColors.white),
        activeColorPrimary: CupertinoColors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        onPressed: (context){
            Navigator
                .of(appContext, rootNavigator: true)
                .pushAndRemoveUntil(
                    CupertinoPageRoute(builder: (BuildContext context)
                    {return const SurveyScreen();}, ), (_) => false, );
        }
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.doc_chart),
        title: ("Report"),
        textStyle: const TextStyle(color: CupertinoColors.black, fontFamily: "Poppins"),
        activeColorPrimary: CupertinoColors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person),
        title: ("Profile"),
        textStyle: const TextStyle(color: CupertinoColors.black, fontFamily: "Poppins"),
        activeColorPrimary: CupertinoColors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: PersistentTabView(
          context,
          controller: PersistentTabController(initialIndex: 0),
          screens: _buildScreens(),
          items: _navBarsItems(),
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: false,
          stateManagement: true,
          hideNavigationBarWhenKeyboardAppears: true,
          popBehaviorOnSelectedNavBarItemPress: PopBehavior.once,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(2.5),
          backgroundColor: CupertinoColors.white,
          isVisible: true,
          animationSettings: const NavBarAnimationSettings(
            navBarItemAnimation: ItemAnimationSettings(
              duration: Duration(milliseconds: 400),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: ScreenTransitionAnimationSettings(
              animateTabTransition: true,
              duration: Duration(milliseconds: 300),
              screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
            ),
            onNavBarHideAnimation: OnHideAnimationSettings(
              duration: Duration(milliseconds: 100),
              curve: Curves.bounceInOut,
            ),
          ),
          confineToSafeArea: true,
          navBarHeight: 70,
          navBarStyle: NavBarStyle.style15, // Choose the nav bar style with this property
        ),
    );
  }
}
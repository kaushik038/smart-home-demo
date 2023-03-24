import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:smart_home/HomeTab.dart';
import 'package:smart_home/PowerUseTab.dart';
import 'package:smart_home/timerTab.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    PersistentTabController _controller;

_controller = PersistentTabController(initialIndex: 0);


    List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.home),
                title: ("Home"),
                activeColorPrimary: CupertinoColors.activeBlue,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.clock),
                title: ("Schedules"),
                activeColorPrimary: CupertinoColors.activeBlue,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
             PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.lightbulb),
                title: ("Power usage"),
                activeColorPrimary: CupertinoColors.activeBlue,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
        ];
    }


    List<Widget> _buildScreens() {
        return [
         const HomeTab(),
         const TimerTab(),
         const PowerUseTab()
        ];
    }

    return PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
    ); 
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:weather_app/bloc/settings_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/ui/weather_page/weather_page.dart';

import '../settings_page/settings_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final PersistentTabController persistentTabController = PersistentTabController();

  List<Widget> _buildScreens() {
    return [
      const WeatherPage(),
      const SettingsPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: ("Settings"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsBloc, SettingsState>(
      listener: (BuildContext context, SettingsState state) {
        if (state is SettingsSaved) {
          BlocProvider.of<WeatherBloc>(context).add(WeatherLoadData());
          persistentTabController.jumpToTab(0);
        }
      },
      child: PersistentTabView(
        context,
        controller: persistentTabController,
        screens: _buildScreens(),
        items: _navBarsItems(),
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style12,
      ),
    );
  }
}

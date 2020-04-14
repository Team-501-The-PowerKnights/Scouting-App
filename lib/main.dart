// Flutter imports
import 'package:flutter/material.dart';

// Package imports
import 'package:shared_preferences/shared_preferences.dart';

// Project imports
import 'package:scouting_app/routes/home/home.dart';
import 'package:scouting_app/routes/setup/greeting.dart';
import 'package:scouting_app/themes.dart';

void main() => runApp(ScoutingApp());

class ScoutingApp extends StatelessWidget {
  /// If the user has completed the setup process
  Future<bool> _checkSetup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('setup') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final themes = Themes();
    return FutureBuilder(
      future: _checkSetup(),
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.done
              ? MaterialApp(
                  title: 'Scouting App',
                  debugShowCheckedModeBanner: false,
                  theme: themes.lightTheme,
                  darkTheme: themes.darkTheme,
                  initialRoute: snapshot.data
                      ? HomeRoute.routeName
                      : SetupGreetingRoute.routeName,
                  routes: {
                    HomeRoute.routeName: (ctx) => HomeRoute(),
                    SetupGreetingRoute.routeName: (ctx) => SetupGreetingRoute()
                  },
                )
              : CircularProgressIndicator(),
    );
  }
}

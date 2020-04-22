// Flutter imports
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scouting_app/provider/themeChanger.dart';
import 'package:scouting_app/routes/scouting/match_info.dart';
import 'package:scouting_app/routes/setup/position.dart';

// Package imports
import 'package:shared_preferences/shared_preferences.dart';
// Project imports
import 'package:scouting_app/routes/home/home.dart';
import 'package:scouting_app/routes/setup/greeting.dart';
import 'package:scouting_app/routes/setup/theme.dart';
import 'package:scouting_app/themes.dart';

void main() => runApp(ScoutingAppEntry());

class ScoutingAppEntry extends StatelessWidget {
  /// If the user has completed the setup process
  Future<bool> _checkSetup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('setup') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
      ],
      child: Consumer<ThemeChanger>(
        builder: (context, themeChanger, _) => FutureBuilder(
          future: _checkSetup(),
          builder: (context, snapshot) => snapshot.connectionState ==
                  ConnectionState.done
              ? MaterialApp(
                  title: 'Scouting App',
                  debugShowCheckedModeBanner: false,
                  theme: Themes().lightTheme,
                  darkTheme: Themes().darkTheme,
                  themeMode: themeChanger.activeTheme,
                  // initialRoute: MatchInfoScreen.routeName, // TODO - for testing purposes only
                  initialRoute: snapshot.data
                      ? HomeRoute.routeName
                      : SetupGreetingRoute.routeName,
                  routes: {
                    HomeRoute.routeName: (ctx) => HomeRoute(),
                    // Setup
                    SetupGreetingRoute.routeName: (ctx) => SetupGreetingRoute(),
                    SetupThemeRoute.routeName: (ctx) => SetupThemeRoute(),
                    SetupPositionRoute.routeName: (ctx) => SetupPositionRoute(),
                    MatchInfoScreen.routeName: (ctx) => MatchInfoScreen(),
                  },
                )
              : Container(),
        ),
      ),
    );
  }
}

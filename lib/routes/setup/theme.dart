// Flutter imports
import 'package:flutter/material.dart';

// Project imports
import 'package:scouting_app/routes/setup/widgets/text.dart';
import 'package:scouting_app/provider/themeChanger.dart';
import 'package:scouting_app/routes/setup/position.dart';
import 'package:scouting_app/routes/setup/widgets/nextbutton.dart';

class SetupThemeRoute extends StatelessWidget {
  static const routeName = '/setup/theme';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              const SetupTitle(),
              SetupSubtitle(
                '🎨 Theme',
              ),
              const SizedBox(height: 20),
              _ThemeOption(
                name: 'System',
                description: 'Theme mode on your device',
                backgroundColor: Colors.black,
                textColor: Colors.white,
                selectedBorderColor: Colors.white,
                themeMode: ThemeMode.system,
              ),
              const _Spacer(),
              _ThemeOption(
                name: "Dark",
                description: "🌑 Dark Mode",
                backgroundColor: Colors.black,
                textColor: Colors.white,
                selectedBorderColor: Colors.white,
                themeMode: ThemeMode.dark,
              ),
              const _Spacer(),
              _ThemeOption(
                name: "Light",
                description: "☀️ Light Mode",
                backgroundColor: Colors.white,
                textColor: Colors.black,
                selectedBorderColor: Colors.black,
                themeMode: ThemeMode.light,
              ),
              const _Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SetupNavigatorButton(
                    text: "Next",
                    routeName: SetupPositionRoute.routeName,
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
      bottomSheet: SetupFooter('theme'),
    );
  }
}

class _Spacer extends StatelessWidget {
  const _Spacer();
  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 20);
  }
}

class _ThemeOption extends StatelessWidget {
  final String name;
  final String description;
  final Color backgroundColor;
  final Color textColor;
  final Color selectedBorderColor;
  final ThemeMode themeMode;

  _ThemeOption({
    @required this.name,
    @required this.description,
    @required this.backgroundColor,
    @required this.textColor,
    @required this.selectedBorderColor,
    @required this.themeMode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color: backgroundColor,
        border: ThemeMode.system == themeMode
            ? Border.all(
                color: Colors.green,
                width: 5,
              )
            : Border.all(
                color: Colors.black,
                width: 3,
              ),
      ),
      child: GestureDetector(
        onTap: ThemeChanger().changeActiveTheme(themeMode),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              name,
              style: TextStyle(
                fontSize: 30,
                color: textColor,
              ),
            ),
            Text(
              description,
              style: TextStyle(
                fontSize: 20,
                color: textColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

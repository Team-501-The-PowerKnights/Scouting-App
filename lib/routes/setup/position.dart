// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:shared_preferences/shared_preferences.dart';

// 🌎 Project imports:
import 'package:scouting_app/routes/setup/widgets/text.dart';
import 'package:scouting_app/routes/setup/greeting.dart';
import 'package:scouting_app/routes/setup/widgets/nextbutton.dart';

class SetupPositionRoute extends StatelessWidget {
  static const routeName = '/setup/position';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SetupTitle(),
            const SetupSubtitle('Position'),
            const SizedBox(height: 50),
            const _PositionOptions(),
            const _Spacer(),
            SetupNavigatorButton(
              text: 'Next',
              routeName: SetupGreetingRoute.routeName,
            ),
          ],
        ),
      ),
      bottomSheet: SetupFooter('position'),
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

enum _Position { Red1, Red2, Red3, Blue1, Blue2, Blue3 }

class _PositionOptions extends StatefulWidget {
  const _PositionOptions();
  @override
  State<StatefulWidget> createState() {
    return _PositionOptionsState();
  }
}

class _PositionOptionsState extends State<_PositionOptions> {
  static _Position _position = _Position.Red1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      verticalDirection: VerticalDirection.up,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              width: 150,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(50),
              ),
              child: RadioListTile<_Position>(
                title: const _PositionOptionTitle(title: 'Red 1'),
                activeColor: Colors.white,
                value: _Position.Red1,
                groupValue: _position,
                onChanged: (_Position value) {
                  _setSelected('Blue 3');
                  setState(() {
                    _position = value;
                  });
                },
              ),
            ),
            const _Spacer(),
            Container(
              width: 150,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(50),
              ),
              child: RadioListTile<_Position>(
                title: const _PositionOptionTitle(title: 'Red 2'),
                activeColor: Colors.white,
                value: _Position.Red2,
                groupValue: _position,
                onChanged: (_Position value) {
                  _setSelected('Blue 3');
                  setState(() {
                    _position = value;
                  });
                },
              ),
            ),
            const _Spacer(),
            Container(
              width: 150,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(50),
              ),
              child: RadioListTile<_Position>(
                title: const _PositionOptionTitle(title: 'Red 3'),
                activeColor: Colors.white,
                value: _Position.Red3,
                groupValue: _position,
                onChanged: (_Position value) {
                  _setSelected('Blue 3');
                  setState(() {
                    _position = value;
                  });
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 30,
        ),
        Column(
          children: <Widget>[
            Container(
              width: 150,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50),
              ),
              child: RadioListTile<_Position>(
                title: const _PositionOptionTitle(title: 'Blue 1'),
                activeColor: Colors.white,
                value: _Position.Blue1,
                groupValue: _position,
                onChanged: (_Position value) {
                  _setSelected('Blue 3');
                  setState(() {
                    _position = value;
                  });
                },
              ),
            ),
            const _Spacer(),
            Container(
              width: 150,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50),
              ),
              child: RadioListTile<_Position>(
                title: const _PositionOptionTitle(title: 'Blue 2'),
                activeColor: Colors.white,
                value: _Position.Blue2,
                groupValue: _position,
                onChanged: (_Position value) {
                  _setSelected('Blue 3');
                  setState(() {
                    _position = value;
                  });
                },
              ),
            ),
            const _Spacer(),
            Container(
              width: 150,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50),
              ),
              child: RadioListTile<_Position>(
                title: const _PositionOptionTitle(title: 'Blue 3'),
                activeColor: Colors.white,
                value: _Position.Blue3,
                groupValue: _position,
                onChanged: (_Position value) {
                  _setSelected('Blue 3');
                  setState(() {
                    _position = value;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _setSelected(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Position', name);
  }
}

class _PositionOptionTitle extends StatelessWidget {
  final String title;

  const _PositionOptionTitle({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    );
  }
}

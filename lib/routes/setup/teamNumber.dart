// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:shared_preferences/shared_preferences.dart';

// 🌎 Project imports:
import 'package:scouting_app/routes/setup/widgets/text.dart';
import 'package:scouting_app/routes/setup/position.dart';
import 'package:scouting_app/routes/setup/widgets/nextbutton.dart';

class SetupTeamNumberRoute extends StatelessWidget {
  static const routeName = '/setup/teamNumber';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SetupTitle(),
            const SetupSubtitle('Team Number'),
            const SizedBox(height: 50),
            const _TeamNumberInput(),
            const _Spacer(),
            SetupNavigatorButton(
                text: 'Next', routeName: SetupPositionRoute.routeName),
          ],
        ),
      ),
      bottomSheet: SetupFooter('team number'),
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

String _teamNumber;

class _TeamNumberInput extends StatefulWidget {
  const _TeamNumberInput();
  @override
  _TeamNumberInputState createState() => _TeamNumberInputState();
}

class _TeamNumberInputState extends State<_TeamNumberInput> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 200.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: TextField(
            keyboardType: TextInputType.numberWithOptions(),
            maxLength: 4,
            decoration: InputDecoration(
              hintText: 'Your Team Number',
            ),
            onChanged: (String _number) {
              _setSelected('$_teamNumber');
              setState(() {
                _teamNumber = _number;
              });
            },
          ),
        ),
      ),
    );
  }

  Future<void> _setSelected(String number) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Team Number', number);
  }
}

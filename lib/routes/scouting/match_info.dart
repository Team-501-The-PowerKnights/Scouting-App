// Flutter imports
import 'package:flutter/material.dart';

// Package imports
import 'package:shared_preferences/shared_preferences.dart';

// Project imports
import 'package:scouting_app/widgets/navbutton.dart';
import 'package:scouting_app/routes/scouting/widgets/text.dart';
import 'package:scouting_app/widgets/text.dart';

class MatchInfoScreen extends StatelessWidget {
  static const routeName = '/scouting/match_info';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const ScoutingTitle(),
              Subtitle('Match Information'),
              const SizedBox(height: 60),
              const DataEntryTitle(text: 'Match Type'),
              const _Spacer(),
              _MatchTypeOptions(),
              const _Spacer(),
              DataEntryTitle(text: 'Match Number'),
              const _Spacer(),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Match number'),
                onSubmitted: (String value) {
                  _setData(value);
                },
              ),
              const SizedBox(height: 20),
              NavigatorButton(
                text: 'Next',
                routeName: MatchInfoScreen.routeName,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _setData(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Match Number', name);
  }
}

class _Spacer extends StatelessWidget {
  const _Spacer();
  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 20);
  }
}

enum _MatchType { Qualification, Elimination }

class _MatchTypeOptions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MatchTypeOptionsState();
}

class _MatchTypeOptionsState extends State<_MatchTypeOptions> {
  _MatchType _matchType = _MatchType.Qualification;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        RadioListTile<_MatchType>(
          title: Text('Qualification'),
          value: _MatchType.Qualification,
          groupValue: _matchType,
          onChanged: (_MatchType value) {
            _setSelected('Qualification');
            setState(() {
              _matchType = value;
            });
          },
        ),
        RadioListTile<_MatchType>(
          title: Text('Elimination'),
          value: _MatchType.Elimination,
          groupValue: _matchType,
          onChanged: (_MatchType value) {
            _setSelected('Elimination');
            setState(() {
              _matchType = value;
            });
          },
        ),
      ],
    );
  }

  Future<void> _setSelected(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Match Type', name);
  }
}

import 'package:flutter/material.dart';
import 'package:scouting_app/widgets/text.dart';

class ScoutingTitle extends StatelessWidget {
  const ScoutingTitle();

  @override
  Widget build(BuildContext context) {
    return SectionTitle(title: 'Data Entry');
  }
}

class DataEntryTitle extends StatelessWidget {

  final String text;

  const DataEntryTitle({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24,
        fontFamily: 'Nunito'
      ),
    );
  }
}

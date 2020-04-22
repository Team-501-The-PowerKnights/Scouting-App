import 'package:flutter/material.dart';
import 'package:scouting_app/widgets/text.dart';

class SetupTitle extends StatelessWidget {
  const SetupTitle();

  @override
  Widget build(BuildContext context) {
    return SectionTitle(title: 'Setup');
  }
}

class SetupFooter extends StatelessWidget {
  final String settingStep;

  SetupFooter(this.settingStep);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.only(bottom: 10),
      child: Center(
        child: Text(
          'The $settingStep can be changed at any time',
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Raleway',
          ),
        ),
      ),
    );
  }
}

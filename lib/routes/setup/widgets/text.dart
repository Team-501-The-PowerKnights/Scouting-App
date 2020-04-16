// Flutter imports
import 'package:flutter/material.dart';

class SetupTitle extends StatelessWidget {
  const SetupTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Setup',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 80,
        fontFamily: 'Raleway',
        decoration: TextDecoration.underline,
      ),
    );
  }
}

class SetupSubtitle extends StatelessWidget {
  final String subTitle;

  SetupSubtitle(this.subTitle);

  @override
  Widget build(BuildContext context) {
    return Text(
      subTitle,
      style: TextStyle(
        fontSize: 30,
        fontFamily: 'Raleway',
      ),
    );
  }
}

class SetupFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.only(bottom: 10),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.settings,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Settings can be changed at any time',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Raleway',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

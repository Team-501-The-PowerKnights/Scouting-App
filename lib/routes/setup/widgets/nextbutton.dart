// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class SetupNavigatorButton extends StatelessWidget {
  final String text;
  final String routeName;

  const SetupNavigatorButton({@required this.text, @required this.routeName});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      onPressed: () => Navigator.popAndPushNamed(
        context,
        routeName,
      ),
      color: Colors.green,
      splashColor: Colors.green,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          const Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

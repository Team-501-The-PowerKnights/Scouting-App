import 'package:flutter/material.dart';

import 'package:scouting_app/screens/setup/personal.dart';
import 'package:scouting_app/widgets/animations/fade.dart';

class SetupStartScreen extends StatelessWidget {
  const SetupStartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeIn(
              delay: 1,
              child: Text(
                "👋 Hello!",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              start: 130,
            ),
            SizedBox(height: 40),
            FadeIn(
              delay: 5,
              child: Text(
                "Lets get you setup",
                style: TextStyle(fontSize: 25),
              ),
              start: -130,
            ),
            SizedBox(height: 40),
            FadeIn(
              start: 130,
              delay: 9,
              duration: const Duration(seconds: 1),
              child: FittedBox(
                child: RaisedButton(
                  color: Color.fromRGBO(84, 182, 142, 0.7),
                  elevation: 10,
                  hoverElevation: 1,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SetupPersonalScreen(),
                      ),
                    );
                  },
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Start Setup",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 7),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

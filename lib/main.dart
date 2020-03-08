import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:scouting_app/screens/aboutUs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.white,
        fontFamily: "Nunito",
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          child: FloatingActionButton(
            heroTag: null,
            onPressed: () {},
            child: Icon(Icons.settings),
          ),
        ),
        title: Text(
          "FRC 501 Scouting",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              // left: 8.0,
              top: 10.0,
              bottom: 10.0,
            ),
            child: FloatingActionButton(
              heroTag: null,
              onPressed: null,
              child: Icon(
                Icons.bluetooth,
                color: Colors.red,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutUsScreen(),
                  ),
                );
              },
              child: Image(
                image: AssetImage('assets/images/black-powerKnights-logo.png'),
              ),
            ),
          ),
          SizedBox(width: 10)
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(
              seconds: 1,
              milliseconds: 50,
            ),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: 120.0,
              child: FadeInAnimation(child: widget),
            ),
            children: <Widget>[
              Text(
                "👋 Hello!",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                "Welcome to Team 501 the PowerKnights'\n Scouting Application",
                textAlign: TextAlign.center,
              ),
              Text(
                "\nClick on the Settings button above to get started.",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

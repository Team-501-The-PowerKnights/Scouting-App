// Flutter imports
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {

  final String title;

  const SectionTitle({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 80,
        fontFamily: 'Raleway',
        decoration: TextDecoration.underline,
      ),
    );
  }

}

class Subtitle extends StatelessWidget {
  final String subTitle;

  Subtitle(this.subTitle);

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
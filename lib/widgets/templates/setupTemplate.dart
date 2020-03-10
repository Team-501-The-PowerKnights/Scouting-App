import 'package:flutter/material.dart';

class SetupScreenTemplate extends StatelessWidget {
  final Widget body;
  final String pageName;
  final bool forcedLeading;

  SetupScreenTemplate({
    @required this.body,
    @required this.pageName,
    this.forcedLeading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: forcedLeading
          ? AppBar(
              title: Text("⚙️ Setup - $pageName"),
              centerTitle: true,
              leading: Icon(
                Icons.do_not_disturb,
                color: Colors.black,
              ),
            )
          : AppBar(
              title: Text("⚙️ Setup - $pageName"),
              centerTitle: true,
            ),
    );
  }
}

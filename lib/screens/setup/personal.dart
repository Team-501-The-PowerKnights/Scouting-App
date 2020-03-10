import 'package:flutter/material.dart';
import 'package:scouting_app/widgets/templates/setupTemplate.dart';

class SetupPersonalScreen extends StatefulWidget {
  const SetupPersonalScreen({Key key}) : super(key: key);

  @override
  _SetupPersonalScreenState createState() => _SetupPersonalScreenState();
}

class _SetupPersonalScreenState extends State<SetupPersonalScreen> {
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  String _firstName;
  String _lastName;
  String _roleOnTeam;

  Widget _buildFirstName() {
    return TextFormField(
      cursorColor: Colors.black,
      decoration: InputDecoration(labelText: "First Name"),
      validator: (String value) {
        if (value.isEmpty) {
          return "First Name is Required";
        }
      },
      onSaved: (String value) {},
    );
  }

  // Widget _buildLastName() {
  //   return null;
  // }

  // Widget _buildRoleOnTeam() {
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    return SetupScreenTemplate(
      pageName: "Personal",
      forcedLeading: true,
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildFirstName(),
              // _buildLastName(),
              // _buildRoleOnTeam(),
              RaisedButton(
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

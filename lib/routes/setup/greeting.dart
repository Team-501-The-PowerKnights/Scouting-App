// Flutter imports
import 'package:flutter/material.dart';

// Package imports
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';


// Project imports
import 'package:scouting_app/routes/setup/theme.dart';
import 'package:scouting_app/routes/setup/widgets/nextbutton.dart';

class SetupGreetingRoute extends StatelessWidget {
  static const routeName = '/setup/greeting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimationLimiter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(seconds: 1),
              childAnimationBuilder: (widget) => SlideAnimation(
                verticalOffset: 50,
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: <Widget>[
                const Text(
                  '👋 Hello!',
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
                const SizedBox(height: 50),
                const Text(
                  'Lets get you setup',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                SetupNavigatorButton(
                  text: 'Start Setup',
                  routeName: SetupThemeRoute.routeName,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

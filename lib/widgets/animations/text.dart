import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimateInText extends StatelessWidget {
  final double verticalOffset;
  final double horizontalOffset;
  final String text;
  final Duration duration;
  final TextStyle textStyle;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  AnimateInText({
    this.verticalOffset = 0.0,
    this.horizontalOffset = 0.0,
    this.textStyle,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
    @required this.text,
    @required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      children: AnimationConfiguration.toStaggeredList(
        duration: duration,
        childAnimationBuilder: (widget) => SlideAnimation(
          horizontalOffset: horizontalOffset,
          verticalOffset: verticalOffset,
          child: FadeInAnimation(
            child: widget,
          ),
        ),
        children: <Widget>[
          ...(text.split(" ")).map(
            (word) {
              return Padding(
                padding: EdgeInsets.only(left: 7),
                child: (textStyle == null)
                    ? Text(word)
                    : Text(
                        word,
                        style: textStyle,
                      ),
              );
            },
          )
        ],
      ),
    );
  }
}

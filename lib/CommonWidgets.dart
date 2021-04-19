import 'package:flutter/material.dart';

// this file will contain all of the common, reusable widgets for our application



class ProgressBarButton extends StatelessWidget {
  const ProgressBarButton({
    Key key,
    this.borderData,
    this.colorData,
    this.width,
    this.height,
  }) : super(key: key);

  final Border borderData;
  final Color colorData;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: borderData,
      ),
      child: Padding(
        padding: EdgeInsets.all(1.0),
        child: Container(
          width: this.width,
          height: this.height,
          child: Container(
            decoration: new BoxDecoration(
              color: colorData,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

// Reusable Card Widget

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this.onPress});

  // This is a property, we can pass through the color based on the property
  // that we have created
  // When we put final to remove immutable error for the Class above
  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}

// Text box for user input that can be customized with the following parameters

class UsrInputTxtBox extends StatelessWidget {
  const UsrInputTxtBox({
    Key key, @required this.fieldColor, this.paddingLeft, this.paddingBottom, this.hintTextColor, this.borderRadius,
    this.fieldHeight, this.hintText
  }) : super(key: key);

  final Color fieldColor;
  final double paddingLeft;
  final double paddingBottom;
  final Color hintTextColor;
  final double borderRadius;
  final double fieldHeight;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: fieldColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      height: fieldHeight,
      child: Padding(
        padding: EdgeInsets.fromLTRB(paddingLeft, 0, 0,
            paddingBottom),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(color: hintTextColor),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:soar_initial_screens/ThemeData/ColorUtils.dart';
import 'package:soar_initial_screens/ThemeData/SizingUtils.dart';

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


// this widget can be used to create the button that is present on most screens
// ignore: must_be_immutable
class ReusableButton extends StatelessWidget {
  ReusableButton({
    Key key, this.buttonText, this.buttonHeight, this.textSize, this.textColor, this.onPressed,
    this.buttonColor = LIGHT_BLUE,
  }) : super(key: key);

  String buttonText;
  double buttonHeight;
  double textSize;
  Color textColor;
  VoidCallback onPressed;
  Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(BORDER_RADIUS),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
              color: Colors.white,
              fontSize: textSize,
        ),
      ),
    )
    );
  }
}



// generates a dynamic circular progress bar based on the number of pages and the current page the user is extension
// ignore: must_be_immutable
class CircularProgressBar extends StatelessWidget {
  CircularProgressBar({
    Key key, @required this.numPages, @required this.currPage,
  }) : super(key: key);

  int numPages;
  int currPage;

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for(int i = 1; i < numPages; i++)
          Row(
            children: [
              ProgressBarButton(
                colorData: i == currPage ?  Color(0xFF6AABEF) : Color(0xFFCDCDCD),
                width: MediaQuery
                    .of(context)
                    .size
                    .height * PROG_BAR_SCALER,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * PROG_BAR_SCALER,
              ),
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .height * HUNDRETH_SCALER,
              ),
            ],
          ),
        ProgressBarButton(
          colorData: numPages == currPage ?  Color(0xFF6AABEF) : Color(0xFFCDCDCD),
          width: MediaQuery
              .of(context)
              .size
              .height * PROG_BAR_SCALER,
          height: MediaQuery
              .of(context)
              .size
              .height * PROG_BAR_SCALER,
        ),
      ],
    );
  }
}
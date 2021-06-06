import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Background extends StatelessWidget {
  Background(this.backgroundImage, this.childWidget);

  final AssetImage backgroundImage;
  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                alignment: Alignment(0, 0),
                image: backgroundImage,
                fit: BoxFit.cover),
          ),
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      topLeft: Radius.circular(40.0),
                    ),
                    color: Colors.white,
                  ),
                  child: childWidget,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

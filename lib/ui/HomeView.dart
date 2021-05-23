import 'package:flutter/material.dart';
import 'package:soar_initial_screens/ui/BaseWidget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, sizingInformation) {
      return Scaffold(
          body: Center(
            child: Text(sizingInformation.toString()),
          ));
    });
  }
}
import 'package:flutter/widgets.dart';
import 'package:soar_initial_screens/enums/DeviceScreenType.dart';

class SizingInformation {
  final Orientation orientation;
  final DeviceScreenType deviceType;
  final Size screenSize;
  final Size localWidgetSize;

  SizingInformation({
    this.orientation,
    this.deviceType,
    this.screenSize,
    this.localWidgetSize,
  });

  @override
  String toString() {
    return 'Orientation:$orientation DeviceType:$deviceType ScreenSize:$screenSize LocalWidgetSize:$localWidgetSize';
  }
}
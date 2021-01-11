import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// Animated Widget Spinner with Spinkit
// https://pub.dev/packages/flutter_spinkit

class LoadingSpinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SpinKitFoldingCube(
          color: Colors.black,
          size: 100.0,
        ),
      ),
    );
  }
}

import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late ArCoreController controller;
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          home: Scaffold(
            body: Center(
              child: ArCoreView(
                enablePlaneRenderer: true,
                enableTapRecognizer: true,
                onArCoreViewCreated: (ArCoreController controller) {
                  this.controller = controller;
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

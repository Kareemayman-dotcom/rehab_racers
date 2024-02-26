import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehab_racers/features/plain_detection/presentation/cubits/plain_detection_cubit/plain_detection_cubit.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ArCoreView(
          enablePlaneRenderer: true,
          enableTapRecognizer: true,
          onArCoreViewCreated:
              context.read<PlainDetectionCubit>().onArCoreViewCreated,
        ),
      ),
    );
  }
}

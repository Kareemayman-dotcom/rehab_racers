import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehab_racers/config/routes/app_routes.dart';
import 'package:rehab_racers/features/plain_detection/presentation/cubits/plain_detection_cubit/plain_detection_cubit.dart';
import 'package:rehab_racers/home_screen..dart';

/// Application routes
class AppRoutes {
  /// this method is used to generate the routes
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          maintainState: false,
          builder: (context) {
            return BlocProvider(
              create: (context) => PlainDetectionCubit(),
              child: HomeScreen(),
            );
          },
          settings: const RouteSettings(name: Routes.initialRoute),
        );
    }
  }
}

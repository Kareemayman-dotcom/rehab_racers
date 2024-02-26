import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

part 'plain_detection_state.dart';

class PlainDetectionCubit extends Cubit<PlainDetectionState> {
  late ArCoreController arCoreController;
  late ArCoreHitTestResult lasthit;
  late ArCoreNode level;
  PlainDetectionCubit() : super(PlainDetectionInitial()) {}
  _handleOnNodeTap(String name) {
    // ... (Action when tapping a 3D node)
  }
  _handleOnPlaneTap(List<ArCoreHitTestResult> hits) {
    final hit = hits.last; // Access the details of the detected plane
    lasthit.pose.translation = hit.translation;
    level = ArCoreNode(
        position: hit.translation,
        shape: ArCoreSphere(
          materials: [
            ArCoreMaterial(
                color: Colors.red, metallic: 1, reflectance: 1, roughness: 0.6)
          ],
        ));
    arCoreController.removeNode(nodeName: "nodeList");

    arCoreController.addArCoreNodeWithAnchor(level
        // ArCoreReferenceNode(

        //   name: "lines",
        //   object3DFileName: 'streight_line.gltf',
        //   position: hit.pose.translation,
        //   objectUrl: "assets/streight_line.gltf",
        //   // scale: vector.Vector3(0.5, 0.5, 0.5),
        // ),
        );
    Future<bool> _checkCollision() async {
      vector.Vector3 cameraPosition =
          await arCoreController.getCameraPosition();

      vector.Vector3 nodePosition = await arCoreController.get();

      // Define your collision thresholds
      final xThreshold = 0.2;
      final zThreshold = 0.2;

      return (cameraPosition.x - nodePosition.x).abs() < xThreshold &&
          (cameraPosition.z - nodePosition.z).abs() < zThreshold;
    }

    print(hit.pose);
    // ... (Do something with the plane, e.g., add an anchor)
  }

  void onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController.onPlaneTap = _handleOnPlaneTap;
    arCoreController.onNodeTap =
        _handleOnNodeTap; // Optional if you want to interact with 3D models
  }

  void planesDetected(List<ArCoreHitTestResult> planes) {
    emit(PlainDetected());
  }
}

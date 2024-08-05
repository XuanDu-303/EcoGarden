import 'package:get/get.dart';

// class Dimensions {
//   double? screenHeight;
//   double? screenWidth;
//   static double screenSize({double? h, double? w}) {
//     final screenHeight = Get.context!.height;
//     final screenWidth = Get.context!.width;
//     // standard height size of iphone 14 pro max
//     double heightValue(double height) => screenHeight/ (896 / height);
//     double widthValue(double width) => screenWidth/ (414 / width);
//
//     List<double?> parameters = [h, w];
//     parameters.removeWhere((element) => element == null);
//
//     if (parameters.length > 1) {
//       throw ArgumentError('Only one parameter is allowed.');
//     } else if (parameters.isEmpty) {
//       throw ArgumentError('One parameter must be provided.');
//     } else {
//       if (h != null) {
//         return heightValue(h);
//       } else if (w != null) {
//         return widthValue(w);
//       }
//     }
//
//     throw ArgumentError('Invalid arguments provided.');
//   }
// }

import 'package:get/get.dart';

class Dimensions {
  double? screenHeight;
  double? screenWidth;

  static double screenSize({double? h, double? w, double? auto}) {
    final screenHeight = Get.context!.height;
    final screenWidth = Get.context!.width;

    double heightValue(double height) => screenHeight / (896 / height);
    double widthValue(double width) => screenWidth / (414 / width);

    List<double?> parameters = [h, w, auto];
    parameters.removeWhere((element) => element == null);

    if (parameters.length > 1) {
      throw ArgumentError('Only one parameter is allowed.');
    } else if (parameters.isEmpty) {
      throw ArgumentError('One parameter must be provided.');
    } else {
      if (h != null) {
        return heightValue(h);
      } else if (w != null) {
        return widthValue(w);
      } else if (auto != null) {
        if (screenHeight > screenWidth) {
          return heightValue(auto);
        } else {
          return widthValue(auto/3);
        }
      }
    }

    throw ArgumentError('Invalid arguments provided.');
  }
}
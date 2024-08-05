import 'dart:math';

import 'package:untitled2/models/plants.dart';

class Garden {
  String id;
  String gardenName;
  String imageUrl;
  int humidity;
  int temperature;
  int waterLevel;
  List<Plant> plants;

  Garden({
    this.id = "",
    required this.gardenName,
    required this.imageUrl,
    required this.humidity,
    required this.temperature,
    required this.waterLevel,
    required this.plants,
  });

  factory Garden.fromJson(Map<String, dynamic> json, {String? id}) {
    return Garden(
      id: id ?? json['id'],
      gardenName: json['gardenName'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      humidity: (json['humidity'] as int?) ?? 0,
      temperature: (json['temperature'] as int?) ?? 0,
      waterLevel: (json['waterLevel'] as int?) ?? 0,
      plants: (json['plants'] as List<dynamic>?)
          ?.map((plantJson) => Plant.fromJson(plantJson))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gardenName': gardenName,
      'imageUrl': imageUrl,
      'humidity': humidity,
      'temperature': temperature,
      'waterLevel': waterLevel,
      'plants': plants.map((plant) => plant.toJson()).toList(),
    };
  }
}

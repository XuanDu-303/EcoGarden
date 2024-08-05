import 'package:cloud_firestore/cloud_firestore.dart';

class Plant {
  String id;
  String imageUrl;
  String plantName;
  String plantType;
  DateTime harvestDate;
  DateTime plantDate;
  double temperature;
  double moistureLevel;
  double price;
  String description;

  Plant({
    this.id = '',
    required this.imageUrl,
    required this.plantName,
    required this.plantType,
    required this.harvestDate,
    required this.plantDate,
    required this.temperature,
    required this.moistureLevel,
    required this.price,
    required this.description,
  });

  Map<String, dynamic> toJson() => {
    'imageUrl': imageUrl,
    'plantName': plantName,
    'plantType': plantType,
    'harvestDate': harvestDate,
    'plantDate': plantDate,
    'temperature': temperature,
    'moistureLevel': moistureLevel,
    'price': price,
    'description': description,
  };

  static Plant fromJson(Map<String, dynamic> json, {String? id}) {
    return Plant(
      id: id ?? json['id'],
      imageUrl: json['imageUrl'] ?? '',
      plantName: json['plantName'] ?? '',
      plantType: json['plantType'] ?? '',
      harvestDate: (json['harvestDate'] as Timestamp?)?.toDate() ?? DateTime.now(),
      plantDate: (json['plantDate'] as Timestamp?)?.toDate() ?? DateTime.now(),
      temperature: (json['temperature'] as double?) ?? 0.0,
      moistureLevel: (json['moistureLevel'] as double?) ?? 0.0,
      price: (json['price'] as double?) ?? 0.0,
      description: json['description'] ?? '',
    );
  }

  int daysBetween(DateTime date) {
    final difference = DateTime.now().difference(date).inDays;
    return difference.abs();
  }
}

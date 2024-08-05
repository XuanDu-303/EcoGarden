import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled2/models/plants.dart';

import '../models/gardens.dart';
import 'add_plants_page.dart';

class CreateGardenPage extends StatefulWidget {
  const CreateGardenPage({super.key});

  @override
  _CreateGardenPageState createState() => _CreateGardenPageState();
}

class _CreateGardenPageState extends State<CreateGardenPage> {
  final TextEditingController gardenNameController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController humidityController = TextEditingController();
  final TextEditingController temperatureController = TextEditingController();
  final TextEditingController waterLevelController = TextEditingController();

  List<Plant> plants = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Garden'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: gardenNameController,
              decoration: const InputDecoration(labelText: 'Garden Name'),
            ),
            TextField(
              controller: imageUrlController,
              decoration: const InputDecoration(labelText: 'Image URL'),
            ),
            TextField(
              controller: humidityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Humidity'),
            ),
            TextField(
              controller: temperatureController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Temperature'),
            ),
            TextField(
              controller: waterLevelController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Water Level'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(

              onPressed: () async {
                String gardenName = gardenNameController.text;
                String imageUrl = imageUrlController.text;
                int humidity = int.tryParse(humidityController.text) ?? 0;
                int temperature = int.tryParse(temperatureController.text) ?? 0;
                int waterLevel = int.tryParse(waterLevelController.text) ?? 0;

                Garden newGarden = Garden(
                  gardenName: gardenName,
                  imageUrl: imageUrl,
                  humidity: humidity,
                  temperature: temperature,
                  waterLevel: waterLevel,
                  plants: plants,
                );

                createGarden(newGarden);
              },
              child: const Text('Create Garden'),
            ),
          ],
        ),
      ),
    );
  }


  Stream<List<Garden>> readPlants() => FirebaseFirestore.instance
      .collection('gardens')
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => Garden.fromJson(doc.data())).toList());

  Future<void> createGarden(Garden garden) async {
    try {
      final randomId = _generateRandomId(10);

      final docGardens = FirebaseFirestore.instance.collection('gardens').doc();
      garden.id = randomId; // Set the ID in the Garden object
      final json = garden.toJson();
      await docGardens.set(json);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddPlantPage(),
        ),
      );
    } catch (error) {
      print('Error creating garden: $error');
      // Handle the error accordingly (e.g., show an error message to the user)
    }
  }
  String _generateRandomId(int length) {
    final random = Random();
    const chars = '0123456789';
    return String.fromCharCodes(Iterable.generate(
      length,
          (_) => chars.codeUnitAt(random.nextInt(chars.length)),
    ));
  }
}

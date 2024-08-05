// add_plant_page.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/models/plants.dart';

import '../models/gardens.dart';
import '../widgets/text_field_widget.dart';

class AddPlantPage extends StatefulWidget {

  const AddPlantPage({Key? key}) : super(key: key);

  @override
  _AddPlantPageState createState() => _AddPlantPageState();
}

class _AddPlantPageState extends State<AddPlantPage> {
  final TextEditingController plantNameController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController harvestDateController = TextEditingController();
  final TextEditingController plantDateController = TextEditingController();
  final TextEditingController temperatureController = TextEditingController();
  final TextEditingController moistureLevelController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: plantNameController,
              decoration: InputDecoration(labelText: 'Plant Name'),
            ),
            TextField(
              controller: imageUrlController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            InkWell(
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (picked != null && picked != selectedDate) {
                  setState(() {
                    selectedDate = picked;
                    harvestDateController.text = picked
                        .toString(); // You can format the date as needed
                  });
                }
              },
              child: IgnorePointer(
                child: TextFieldWidget(
                  text: "harvestDate",
                  hinText: "04/25/2001",
                  controller: harvestDateController,
                ),
              ),
            ),InkWell(
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (picked != null && picked != selectedDate) {
                  setState(() {
                    selectedDate = picked;
                    plantDateController.text = picked
                        .toString(); // You can format the date as needed
                  });
                }
              },
              child: IgnorePointer(
                child: TextFieldWidget(
                  text: "plantDate",
                  hinText: "04/25/2001",
                  controller: plantDateController,
                ),
              ),
            ),
            TextField(
              controller: temperatureController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Temperature'),
            ),
            TextField(
              controller: moistureLevelController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Moisture Level'),
            ),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Price'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {

                String plantName = plantNameController.text;
                String imageUrl = imageUrlController.text;
                String harvestDate = harvestDateController.text;
                String plantDate = plantDateController.text;
                double temperature = double.tryParse(temperatureController.text) ?? 0.0;
                double moistureLevel = double.tryParse(moistureLevelController.text) ?? 0.0;
                double price = double.tryParse(priceController.text) ?? 0.0;
                String description = descriptionController.text;

                Plant newPlant = Plant(
                  imageUrl: imageUrl,
                  plantName: plantName,
                  plantType: 'Type',
                  harvestDate: DateTime.parse(harvestDate),
                  plantDate: DateTime.parse(plantDate),
                  temperature: temperature,
                  moistureLevel: moistureLevel,
                  price: price,
                  description: description,
                );
                createPlant(newPlant);
              },
              child: Text('Add Plant'),
            ),
          ],
        ),
      ),
    );
  }

  Stream<List<Plant>> readPlants() => FirebaseFirestore.instance
      .collection('gardens')
      .doc('22222222222')
      .collection('plants')
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => Plant.fromJson(doc.data())).toList());

  Future createPlant(Plant plant) async {
    final docPlants = FirebaseFirestore.instance.collection('gardens').doc('22222222222').collection('plants').doc();
    plant.id = docPlants.id;
    final json = plant.toJson();
    await docPlants.set(json);
  }

}

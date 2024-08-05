import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/firebase_options.dart';
import 'package:untitled2/pages/create_garden.dart';
import 'package:untitled2/pages/home/main_home_page.dart';
import 'package:untitled2/pages/me/me_page.dart';
import 'package:untitled2/pages/store/plants_store_page.dart';
import 'package:untitled2/pages/welcome/welcome.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const Welcome(),
          '/store': (context) => const PlantsStorePage(),
          '/me': (context) => const MePage(),
        },
      ),
    );
  }
}

class DataProvider extends ChangeNotifier {
  int _selectIndex = 0;

  int get selectIndex => _selectIndex;

  void updateSelectIndex(int newData) {
    _selectIndex = newData;
    notifyListeners();
  }
}
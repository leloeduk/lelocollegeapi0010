import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lelocollege/models/chapitre_model.dart';
import 'package:lelocollege/models/classe_model.dart';
import 'package:lelocollege/models/matiere_model.dart';
import 'models/devoir_model.dart';
import 'routes/app_routes.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ClasseModelAdapter());
  Hive.registerAdapter(MatiereModelAdapter());
  Hive.registerAdapter(ChapitreModelAdapter());
  Hive.registerAdapter(DevoirModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Lelo college',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      // Route initiale
      initialRoute: AppRoutes.splash,
      // Définition des routes avec GetX
      getPages: AppRoutes.routes,
    );
  }
}

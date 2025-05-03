import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lelocollege/features/splash/screens/splash_screen.dart';

// Blocs
import 'features/class/bloc/class_bloc.dart';
import 'features/homework/bloc/homework_bloc.dart';
import 'features/document/bloc/document_bloc.dart';

// Models
import 'features/class/models/school_class_model.dart';
import 'features/class/models/subject_model.dart';
import 'features/class/models/chapter_model.dart';

// Services
import 'services/api/data/api_service.dart';
import 'services/api/data/api_homework.dart';
import 'services/api/data/api_document.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialisation des Ads
  await MobileAds.instance.initialize();

  // Initialisation Hive
  await Hive.initFlutter();

  // Enregistrement des adaptateurs
  Hive.registerAdapter(SchoolClassModelAdapter());
  Hive.registerAdapter(SubjectModelAdapter());
  Hive.registerAdapter(ChapterModelAdapter());

  // Ouverture de la box (optionnel ici, peut être fait dans le bloc)
  await Hive.openBox<SchoolClassModel>('classesBox');

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ClassBloc(apiService: ApiService())),
        BlocProvider(
          create: (context) => HomeworkBloc(apiHomework: ApiHomework()),
        ),
        BlocProvider(
          create: (context) => DocumentBloc(apiDocument: ApiDocument()),
        ),
        // BlocProvider(create: (context) => AdsBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lelo College',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(),
    );
  }
}

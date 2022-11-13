import './components/Homepage.dart';
import './components/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'components/crop_recommeder.dart';
import 'components/leaf_predictor.dart';
import 'package:camera/camera.dart';
import './components/args/result.dart';

List<CameraDescription>? cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cropance',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashScreen(),
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        CropRecommender.routeName: (context) => CropRecommender(),
        LeafPredictor.routeName: (context) => const LeafPredictor(),
        // Result.routeName : (context) => Result()
      },
    );
  }
}

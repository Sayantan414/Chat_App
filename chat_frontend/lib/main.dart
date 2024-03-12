import 'package:camera/camera.dart';
import 'package:chat_frontend/Screens/CameraScreen.dart';
import 'package:chat_frontend/Screens/Homescreen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Fetch available cameras
    cameras = await availableCameras();
  } catch (e) {
    print('Error fetching cameras: $e');
    return; // Exit the app if an error occurs
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "OpenSans",
        appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 3, 130, 234),
            foregroundColor: Color.fromARGB(255, 248, 249, 250)),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 24),
            ),
      ),
      home: const Homescreen(),
    );
  }
}

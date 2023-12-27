import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_application/screens/WeatherScreen.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(Duration(seconds: 5));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.grey[800],
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.bebasNeue(fontSize: 32,color: Colors.white70),
          bodyMedium: GoogleFonts.bebasNeue(fontSize: 24,color: Colors.white54)
        ),
        useMaterial3: true,

      ),

      home:  WeatherScreen(),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:icma_health/screens/homepage.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const HomePage1(),
          theme: ThemeData(
            textTheme: const TextTheme(
                bodyMedium: TextStyle(color: Colors.white),
                bodySmall: TextStyle(color: Colors.white),
                bodyLarge: TextStyle(color: Colors.black)),
          ),
        );
      },
    );
  }
}

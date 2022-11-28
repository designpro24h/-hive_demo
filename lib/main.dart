import 'package:flutter/material.dart';
import 'package:hive_demo/model/person.dart';
import 'package:hive_demo/screen/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // Initilalize Hive
  await Hive.initFlutter();
  // Regisering the adapter
  Hive.registerAdapter(PersonAdapter());
  // open the box
  var box = await Hive.openBox('myInfo');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    // TODO: implement dispose
    Hive.close();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

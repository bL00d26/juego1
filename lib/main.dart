import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:juego/src/pages/home_page.dart';


 
void main(){
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Juego',
      debugShowCheckedModeBanner: false,      
      initialRoute: "/",
      routes: {
        "/": (BuildContext context)=>HomePage(),
      },
    );
  }
}
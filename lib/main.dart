import 'package:flutter/material.dart';
import 'package:qrreader/src/routes/routes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Reader',
      initialRoute: 'home',

      routes: getApplicationRoutes(),
      
      theme: ThemeData(
        primaryColor: Color.fromRGBO(246, 114, 128, 1)
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:crypto_price_tracker/price_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  // const MainApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: PriceScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:darilko/services/isar_service.dart';
import 'package:darilko/data/gift_data.dart';
import 'package:darilko/screens/home_screen.dart';


void main() async {
  runApp(const MyApp());
  IsarService isarService = IsarService();
  GiftData giftData = GiftData(isarService: isarService);

  await giftData.addPreparedGifts();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Darilko',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 227, 102, 229),
        ),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

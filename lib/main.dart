import 'package:darilko/screens/catalogue_screen.dart';
import 'package:flutter/material.dart';
import 'package:darilko/services/isar_service.dart';
import 'package:darilko/data/gift_data.dart';
import 'package:darilko/screens/home_screen.dart';

/* void main() async {
  runApp(const MyApp());
  IsarService isarService = IsarService(); // Create an instance of IsarService
  GiftData giftData = GiftData(isarService: isarService); // Create an instance of GiftData

  await giftData.addPreparedGifts(); // Add pre-prepared gifts to the database

} */
/* void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  IsarService isarService = IsarService(); // Create an instance of IsarService
  GiftData giftData = GiftData(isarService: isarService); // Create an instance of GiftData

  await giftData.addPreparedGifts(); // Add pre-prepared gifts to the database

  runApp(MyApp(isarService: isarService)); // Pass the IsarService instance to MyApp
} */
void main() async {
  runApp(const MyApp());
  IsarService isarService = IsarService();
  GiftData giftData = GiftData(isarService: isarService);

  await giftData.addPreparedGifts();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  //final IsarService isarService;

  //const MyApp({Key? key, required this.isarService}) : super(key: key);

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

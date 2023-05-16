import 'package:darilko/entities/catalogue.dart';
import 'package:darilko/entities/order.dart';
import 'package:isar/isar.dart';

part 'gift.g.dart';

// TODO: create a gift collection
@Collection()
class Gift {
  Id id = isarAutoIncrementId;
  late int stock;
  late String name;
  late String description;
  late double price;
  late String picturePath;
  late List<String> categories;

  final catalogue = IsarLinks<Catalogue>();
  final order = IsarLinks<Order>();
}

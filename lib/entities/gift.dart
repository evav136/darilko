import 'package:darilko/entities/catalogue.dart';
import 'package:darilko/entities/order.dart';
import 'package:isar/isar.dart';

part 'gift.g.dart';

// TODO: create a gift collection
@Collection()
class Gift {
  Id id = Isar.autoIncrement;
  late int stock;
  late String name;
  late String description;
  late double price;
  late String picturePath;
  late String filter;
  //late List<String> categories;

  //final catalogue = IsarLinks<Catalogue>();
  //final order = IsarLinks<Order>();

   Gift({
    required this.stock,
    required this.name,
    required this.description,
    required this.price,
    required this.picturePath,
    required this.filter,

   // required this.categories,
  });
  /* static Future<void> saveGift(Gift newGift) async {
    final isar = await Isar.getInstance();
    await isar.writeTxn((isar) {
      isar.gifts.put(newGift);
    });
  } */
}

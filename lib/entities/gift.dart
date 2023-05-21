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

  Gift({
    required this.stock,
    required this.name,
    required this.description,
    required this.price,
    required this.picturePath,
    required this.filter,
  });
}

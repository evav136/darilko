import 'package:darilko/entities/gift.dart';
import 'package:isar/isar.dart';

part 'order.g.dart';

@Collection()
class Order {
  Id id = Isar.autoIncrement;
  late DateTime datum;
  late double total;
  late bool paidFor;
  late String address;

  final gifts = IsarLinks<Gift>();

  void addGift(Gift gift) {
    gifts.add(gift);
  }

  void removeGift(Gift gift) {
    gifts.remove(gift);
  }
  // eno narocilo ima lahko vec daril (one to many relationship)
  //@Backlink(to: 'order')
  //final gifts = IsarLinks<Gift>();
}

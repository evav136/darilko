import 'package:darilko/entities/gift.dart';
import 'package:isar/isar.dart';

part 'order.g.dart';

@Collection()
class Order {
  Id id = Isar.autoIncrement;
  late DateTime datum;
  late double total = 0;
  late bool paidFor;
  late String address;

  final gifts = IsarLinks<Gift>();

  void addGift(Gift gift) {
    gifts.add(gift);
    total += gift.price;
  }

  void removeGift(Gift gift) {
    gifts.remove(gift);
    total -= gift.price;
  }
  // eno narocilo ima lahko vec daril (one to many relationship)
  //@Backlink(to: 'order')
  //final gifts = IsarLinks<Gift>();
}

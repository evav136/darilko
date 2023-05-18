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

  // eno narocilo ima lahko vec daril (one to many relationship)
  //@Backlink(to: 'order')
  //final gifts = IsarLinks<Gift>();
}

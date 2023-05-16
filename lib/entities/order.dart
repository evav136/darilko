import 'package:darilko/entities/gift.dart';
import 'package:isar/isar.dart';
import 'package:darilko/entities/order.dart';

part 'order.g.dart';

@Collection()
class Order {
  Id id = isarAutoIncrementId;
  late DateTime datum;
  late double total;
  late bool paidFor;
  late String address;

  // eno narocilo ima lahko vec daril (one to many relationship)
  @Backlink(to: 'order')
  final gifts = IsarLinks<Gift>();
}

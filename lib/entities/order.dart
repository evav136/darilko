import 'package:isar/isar.dart';
import 'package:darilko/entities/gift.dart';

part 'order.g.dart';

@Collection()
class Order {
  Id id = Isar.autoIncrement;
  late String ime;
  late String datum;
  late double total;
  final bool paidFor;
  late String address;
  late int giftId;

  Order(
      {required this.paidFor,
      required this.datum,
      required this.total,
      required this.giftId});

  @override
  String toString() {
    return 'Order(id: $id, ime: $ime, datum: $datum, total: $total, paidFor: $paidFor, address: $address)';
  }
}

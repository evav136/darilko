import 'package:isar/isar.dart';

part 'order.g.dart';

@Collection()
class Order {
  Id id = Isar.autoIncrement;
  late String ime = '';
  late String datum = '';
  late double total = 0;
  late bool paidFor;
  late String address = '';
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
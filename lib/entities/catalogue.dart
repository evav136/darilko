import 'package:darilko/entities/gift.dart';
import 'package:isar/isar.dart';

part 'catalogue.g.dart';

@Collection()
class Catalogue {
  Id id = Isar.autoIncrement;

  // final ctlg = IsarLinks<Gift>();
  // final filtered = IsarLinks<Gift>();

 // @Backlink(to: 'catalogue')
  //final gifts = IsarLinks<Gift>();
}

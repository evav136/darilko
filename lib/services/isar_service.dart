import 'package:isar/isar.dart';
import 'package:darilko/entities/catalogue.dart';
import 'package:darilko/entities/gift.dart';
import 'package:darilko/entities/order.dart';
import 'package:path_provider/path_provider.dart';


class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<void> saveCatalogue(Catalogue newCatalogue) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.catalogues.putSync(newCatalogue));
  }

  Future<void> saveGift(Gift newGift) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.gifts.putSync(newGift));
  }

  Future<void> saveOrder(Order newOrder) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.orders.putSync(newOrder));
  }

  Future<Catalogue> getCatalogue() async {
    throw UnimplementedError();
  }

  Future<List<Gift>> getAllGifts() async {
    throw UnimplementedError();
  }

  Future<List<Order>> getAllOrders() async {
    throw UnimplementedError();
  }

  /*
  Stream<Gift> chooseGift() async* {
    throw UnimplementedError();
  }
  */

  Future<Gift?> getGiftById(int id) async {
    final isar = await db;
    return isar.gifts.get(id);
  }

  Future<Order?> getOrderById(int id) async {
    final isar = await db;
    return isar.orders.get(id);
  }

  Future<void> cleanDb() async {
    throw UnimplementedError();
  }

  Future<Isar> openDB() async {
    // nedokoncano
    final dir = getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [CatalogueSchema],
        directory: ,
        inspector: true);
    }

    return await Future.value(Isar.getInstance());
  }
}

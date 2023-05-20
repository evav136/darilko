import 'package:darilko/entities/catalogue.dart';
import 'package:darilko/entities/gift.dart';
import 'package:darilko/entities/order.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:isar/isar.dart';

class IsarService {
  late Future<Isar> db;
  late Isar isar;
  //late Collection gifts;


  IsarService() {
    db = openDB();
    //cleanDb();
    initializeGifts();

  }
  Future<void> initializeGifts() async {
    isar = await db;
    final gifts = getAllGifts();
  }
  Future<void> cleanDb() async {
        throw UnimplementedError();

      /* final isar = await db;
      await isar.writeTxnSync((isar) {
        //isar.catalogues.deleteAll();
        isar.gifts.deleteAll();
        //isar.orders.deleteAll();
      }; */
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
  final isar = await db;
  final giftQuery = isar.gifts.where();
  print(giftQuery);
  return giftQuery.findAll();
}



  Future<List<Order>> getAllOrders() async {
    throw UnimplementedError();
  }

  Future<List<Gift>> getGiftsByFilter(String filter) async {
    final isar = await db;
    final allGifts = await getAllGifts();
    print(allGifts);
  
    final filteredGifts = allGifts.where((gift) => gift.filter == filter).toList();
  
    return filteredGifts;
    /* final isar = await db;
    
    final giftQuery = isar.gifts.where();

    return await giftQuery.findAll(); */
  }

  Future<Gift?> getGiftById(int id) async {
    final isar = await db;
    return isar.gifts.get(id);
  }

  Future<Order?> getOrderById(int id) async {
    final isar = await db;
    return isar.orders.get(id);
  }

  
  
  Future<Isar> openDB() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/isar-db';

    final dir = Directory(path);
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }

    print(path);
    
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [CatalogueSchema, OrderSchema, GiftSchema],
        inspector: true,
        directory: path,
      );
    }

    return Future.value(Isar.getInstance());
  }
}

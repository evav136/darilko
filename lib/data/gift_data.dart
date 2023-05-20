import 'package:darilko/services/isar_service.dart';
import 'package:darilko/entities/gift.dart';

class GiftData {
  final IsarService isarService;

  GiftData({required this.isarService});

  Future<void> addPreparedGifts() async {
    Gift gift1 = Gift(
      name: "Božični darilni set",
      description: "This is gift 1",
      price: 10.0,
      picturePath: "assets/bozic.jpg",
      stock: 5,
      filter: "BOŽIČ"
    );

    Gift gift2 = Gift(
      name: "Gift 2",
      description: "This is gift 2",
      price: 15.0,
      picturePath: "assets/rd.jpg",
      stock: 3,
      filter: "rd"
    );
    Gift gift3 = Gift(
      name: "Gift 3",
      description: "This is gift 2",
      price: 15.0,
      picturePath: "assets/valentinovo.jpg",
      stock: 3,
      filter: "va"
    );
    Gift gift4 = Gift(
      name: "Gift 4",
      description: "This is gift 2",
      price: 15.0,
      picturePath: "assets/obletnica.jpg",
      stock: 3,
      filter: "ob"
    );
    Gift gift5 = Gift(
      name: "Gift 5",
      description: "This is gift 5",
      price: 15.0,
      picturePath: "assets/bozic2.jpg",
      stock: 3,
      filter: "BOŽIČ"
    );

    await isarService.saveGift(gift1);
    await isarService.saveGift(gift2);
    await isarService.saveGift(gift3);
    await isarService.saveGift(gift4);


  }
}
import 'package:darilko/services/isar_service.dart';
import 'package:darilko/entities/gift.dart';

class GiftData {
  final IsarService isarService;

  GiftData({required this.isarService});

  Future<void> addPreparedGifts() async {
    List<Gift> preparedGifts = [
      Gift(
          name: "Sladki božični darilni set",
          description: "Poskrbite, da bo njegov/njen božič nepozabno sladek.",
          price: 40.0,
          picturePath: "assets/bozic.jpg",
          stock: 5,
          filter: "BOŽIČ"),
      Gift(
          name: "Pot do razvajanja",
          description: "Darilni set za pravo rojstnodnevno razvanjanje.",
          price: 35.0,
          picturePath: "assets/rd.jpg",
          stock: 3,
          filter: "ROJSTNI DAN"),
      Gift(
          name: "Valentinovo sladkanje",
          description:
              "Podarite svoji ljubljeni osebi set z sladkim dobrotami za Valentinovo.",
          price: 25.0,
          picturePath: "assets/valentinovo.jpg",
          stock: 3,
          filter: "VALENTINOVO"),
      Gift(
          name: "Poročni spomin",
          description:
              "Spomnite svojo boljšo polovico na poroko z sporočilci, cvetjem in sladkimi dobrotami.",
          price: 15.0,
          picturePath: "assets/obletnica.jpg",
          stock: 3,
          filter: "OBLETNICA"),
      Gift(
          name: "Božična luč",
          description:
              "Naj to darilo osvetli temne decemberske dni izbrani osebi.",
          price: 25.0,
          picturePath: "assets/bozic2.jpg",
          stock: 3,
          filter: "BOŽIČ"),
      Gift(
          name: "Rojsnodnevni sij",
          description:
              "Podarite svoji dragi osebi set za sijoč rojstnodnevni videz.",
          price: 26.0,
          picturePath: "assets/rdz2.jpg",
          stock: 0,
          filter: "ROJSTNI DAN"),
      Gift(
          name: "Dama eleganca",
          description:
              "Poskrbite, da se bo počutila prav posebno za svoj rojstni dan s tem darilnim setom.",
          price: 28.0,
          picturePath: "assets/rdz3.jpg",
          stock: 4,
          filter: "ROJSTNI DAN"),
      Gift(
          name: "Darilni set za njo",
          description:
              "Sijoč rojstnodnevni videz drage osebe je zagotovljen s tem darilom.",
          price: 26.0,
          picturePath: "assets/rdz4.jpg",
          stock: 2,
          filter: "ROJSTNI DAN"),
      Gift(
          name: "Spiritualni set za njo",
          description:
              "Narediti ji malo drugačen rojstni dan in ga popestrite s turkizno barvo-barvo zdravilnih energij.",
          price: 26.0,
          picturePath: "assets/rdz5.jpg",
          stock: 10,
          filter: "ROJSTNI DAN"),
      Gift(
          name: "Zamrzni poseben trenutek",
          description:
              "Poskrbite, da bo ta trenutek ujet za vedno in podarite krasen set.",
          price: 99.0,
          picturePath: "assets/rdz6.jpg",
          stock: 10,
          filter: "ROJSTNI DAN"),
      Gift(
          name: "Rožnata romantika",
          description:
              "Presenetite svojo ljubljeno osebo z romantičnim darilom za Valentinovo.",
          price: 10.0,
          picturePath: "assets/valen.jpg",
          stock: 5,
          filter: "VALENTINOVO"),
      Gift(
          name: "Valentinov darilni zanj",
          description: "Darilni set za valentinovo zanj.",
          price: 30.0,
          picturePath: "assets/vam1.jpg",
          stock: 3,
          filter: "VALENTINOVO"),
      Gift(
          name: "Gospod Popolnost",
          description:
              "Presenetite svojega posebnega moškega s tem darilom, ki mu bo pokazalo, kako zelo ga občudujete.",
          price: 60.0,
          picturePath: "assets/vam2.jpg",
          stock: 3,
          filter: "VALENTINOVO"),
      Gift(
          name: "Valentinov poklon",
          description: "Poklonite svoji dragi prekrasno darilo.",
          price: 25.0,
          picturePath: "assets/vaz1.jpg",
          stock: 3,
          filter: "VALENTINOVO"),
      Gift(
          name: "Rdeča romantika",
          description:
              "Presenetite svojo ljubljeno osebo z romantičnim darilom za Valentinovo.",
          price: 20.0,
          picturePath: "assets/vaz2.jpg",
          stock: 3,
          filter: "VALENTINOVO"),
      Gift(
          name: "Spomin na dom",
          description:
              "Presenetite svojo ljubljeno osebo z okusnimi babičinimi piškoti.",
          price: 8.0,
          picturePath: "assets/bo1.jpg",
          stock: 3,
          filter: "BOŽIČ"),
      Gift(
          name: "Božič prihaja",
          description: "Poskrbite, da bo ljubljeni osebi za božič toplo.",
          price: 20.0,
          picturePath: "assets/boz2.jpg",
          stock: 3,
          filter: "BOŽIČ"),
      Gift(
          name: "Božični čaj",
          description:
              "Presenetite svojo ljubljeno osebo z čajnim božičnim setom.",
          price: 20.0,
          picturePath: "assets/bo3.jpg",
          stock: 0,
          filter: "BOŽIČ"),
      Gift(
          name: "Božični poklon",
          description:
              "Presenetite svojo ljubljeno osebo z krasnim božičnim setom.",
          price: 30.0,
          picturePath: "assets/bo5.jpg",
          stock: 0,
          filter: "BOŽIČ"),
      Gift(
          name: "Božično razvajanje",
          description:
              "Presenetite svojo ljubljeno osebo z sladkim božičnim setom.",
          price: 10.0,
          picturePath: "assets/boz4.jpg",
          stock: 2,
          filter: "BOŽIČ")
    ];

    for (var gift in preparedGifts) {
      // check if the gift already exists in db
      var exists = await isarService.getGiftByName(gift.name);

      if (exists == null) {
        await isarService.saveGift(gift);
      }
    }
  }
}

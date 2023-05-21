import 'package:flutter/material.dart';
import 'package:darilko/entities/gift.dart';
import 'package:darilko/services/isar_service.dart';
import 'package:darilko/screens/gift_screen.dart';

class AllCatalogueScreen extends StatefulWidget {
  @override
  _AllCatalogueScreenState createState() => _AllCatalogueScreenState();
}

class _AllCatalogueScreenState extends State<AllCatalogueScreen> {
  final IsarService isarService = IsarService();
  List<Gift> gifts = [];
  int currentPage = 1;
  int giftsPerPage = 7;

  @override
  void initState() {
    super.initState();
    loadGifts();
  }

  Future<void> loadGifts() async {
    final allGifts = await isarService.getAllGifts();
    setState(() {
      gifts = allGifts;
    });
  }

  List<Gift> getGiftsForCurrentPage() {
    final startIndex = (currentPage - 1) * giftsPerPage;
    final endIndex = startIndex + giftsPerPage;
    return gifts.sublist(
        startIndex, endIndex < gifts.length ? endIndex : gifts.length);
  }

  void goToNextPage() {
    setState(() {
      if (currentPage < gifts.length ~/ giftsPerPage) {
        currentPage++;
      }
    });
  }

  void goToPreviousPage() {
    setState(() {
      if (currentPage > 1) {
        currentPage--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final giftsToShow = getGiftsForCurrentPage();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Katalog'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/', // Replace 'home' with the actual route name of your home screen
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 18),
          Expanded(
            child: ListView.builder(
              itemCount: giftsToShow.length,
              itemBuilder: (context, index) {
                final gift = giftsToShow[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GiftScreen(gift: gift),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: SizedBox(
                      width: 80,
                      height: 100,
                      child: Image.asset(
                          gift.picturePath), // Display the gift image
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          gift.name, // Display the gift name
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          gift.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                          ), // Adjust the font size as needed
                        ),
                      ],
                    ),
                    trailing: Text(
                      '€${gift.price.toStringAsFixed(2)}', // Display the gift price
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  goToPreviousPage();
                },
              ),
              Text(
                'Stran $currentPage',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  goToNextPage();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

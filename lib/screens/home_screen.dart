import 'package:flutter/material.dart';
import 'package:darilko/screens/catalogue_screen.dart';
import 'package:darilko/services/isar_service.dart';
import 'package:darilko/entities/gift.dart';
import 'package:darilko/screens/all_catalogue_screen.dart';

class HomeScreen extends StatefulWidget {
  IsarService isarService = IsarService();

  HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _saveName() async {
    final String name = _nameController.text.trim();
    if (name.isNotEmpty) {
      Gift newGift = Gift(
          name: "voda",
          description: "h20",
          picturePath: "",
          price: 22.2,
          stock: 3,
          filter: "bo");
      //Gift newGift1 = Gift(name: "voda1", description: "h20", picturePath: "", price: 22.2, stock: 3);

      await widget.isarService.saveGift(newGift);
      _nameController.clear(); // Clear the text field
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80), // Set the desired height here
        child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, top: 12.0),
                  child: Text(
                    'DARILKO',
                    style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Domov'),
                  ),
                ),
                const SizedBox(width: 16),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AllCatalogueScreen()),
                      );
                    },
                    child: Text('Katalog'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Podari darilo svojemu najbližnjemu. ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Izberi priložnost: ',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CatalogueScreen(filter: "VALENTINOVO")),
                              );
                              // Handle tap on Valentine's Day image
                            },
                            child: Column(
                              children: [
                                Text(
                                  'VALENTINOVO',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 139, 129, 129),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Image.asset(
                                    'assets/valen.jpg', // Replace with your image asset
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CatalogueScreen(filter: "ROJSTNI DAN")),
                              );
                              // Handle tap on Birthday image
                            },
                            child: Column(
                              children: [
                                Text(
                                  'ROJSTNI DAN',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Image.asset(
                                    'assets/rd.jpg', // Replace with your image asset
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CatalogueScreen(filter: "OBLETNICA")),
                              );
                              // Handle tap on Anniversary image
                            },
                            child: Column(
                              children: [
                                Text(
                                  'OBLETNICA',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Image.asset(
                                    'assets/obletnica.jpg', // Replace with your image asset
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CatalogueScreen(filter: "BOŽIČ")),
                              );
                              // Handle tap on Christmas image
                            },
                            child: Column(
                              children: [
                                Text(
                                  'BOŽIČ',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Image.asset(
                                    'assets/bozic2.jpg', // Replace with your image asset
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Iščite med darili',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
           ElevatedButton(
              onPressed: () {
                String filter = _nameController.text.trim();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CatalogueScreen(filter: filter),
                  ),
                );
              },
              child: Text('Išči'),
            ),

          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:darilko/entities/gift.dart';
import 'package:darilko/services/isar_service.dart';
import 'package:darilko/screens/gift_screen.dart';

class CatalogueScreen extends StatefulWidget {
  late final String filter;
  //!!!!!!!!filter mamo tuki, ne v naslednjem classu

  CatalogueScreen({required this.filter});
  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  late List<Gift> gifts = []; // List to store the fetched gifts

  @override
  void initState() {
    super.initState();
    _fetchGifts();
  }

  void _fetchGifts() async {
    IsarService isarService = IsarService();
    gifts = await isarService.getGiftsByFilter(widget.filter);
    setState(() {}); // Update the state to trigger a rebuild of the UI
  }
  String filter = "";
  String _selectedItem = 'Rojstni dan'; // Initial selected item

  List<String> _dropdownItems = ['Rojstni dan', 'Obletnica', 'Valentinovo', 'Božič']; // Dropdown menu items

 void _updateFilter(String newValue) {
    setState(() {
      widget.filter = newValue;
    });
    try {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => CatalogueScreen(filter: newValue),
      ),
    );
  } catch (error, stackTrace) {
    // Handle the exception here
    print('Exception occurred: $error');
    print('Stack trace: $stackTrace');
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Padding(
            padding: const EdgeInsets.only(top: 23.0),
            child: Text(
              'Katalog',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          automaticallyImplyLeading: false, // Remove the default back button
          leading: Padding(
            padding: const EdgeInsets.only(top: 22.0, left: 10.0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the previous screen
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 22.0, right: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Go back to the previous screen
                },
                child: const Text('Domov'),
              ),
            ),
          ],
        ),
      ),
      
      body: Column(
  children: [
    Row(
      children: [
        Text(
          '    Izberi priložnost:   ',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(width: 8),
        DropdownButton<String>(
          value: _selectedItem,
          dropdownColor: Color.fromARGB(255, 220, 187, 249),
          onChanged: (String? newValue) {
            setState(() {
              _selectedItem = newValue!;
              _updateFilter(newValue!);
            });
          },
          items: _dropdownItems.map<DropdownMenuItem<String>>(
            (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            },
          ).toList(),
        ),
      ],
    ),
    SizedBox(height: 16),
    Text(
      'Priložnost: ${widget.filter}',
      style: Theme.of(context).textTheme.headline6,
    ),
    SizedBox(height: 16),
    Expanded(
      child: ListView.builder(
        itemCount: gifts.length,
        itemBuilder: (context, index) {
          final gift = gifts[index];
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
          leading: Image.asset(gift.picturePath), // Display the gift image
          title: Text(gift.name), // Display the gift name
          subtitle: Text(gift.description), // Display the gift description
          trailing: Text('\$${gift.price.toStringAsFixed(2)}'), // Display the gift price
        ),
          );
        },
      ),
    ),
  ],
));

      /* body: Column(
        children: [
          Row(
            children: [
              Text(
                '    Izberi priložnost:   ',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(width: 8),
              DropdownButton<String>(
                value: _selectedItem,
                dropdownColor: Color.fromARGB(255, 220, 187, 249), // Set the dropdown menu color to pink

                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue!;
                    _updateFilter(newValue!);
                    Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => CatalogueScreen(filter: newValue),
                ),
              );
                  });
                },
              items: _dropdownItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
        SizedBox(height: 16),
        Text(
          'Filter: ${widget.filter}',
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: gifts.length,
            itemBuilder: (context, index) {
              final gift = gifts[index];
              return ListTile(
                leading: Image.asset(gift.picturePath), // Display the gift image
                title: Text(gift.name), // Display the gift name
                subtitle: Text(gift.description), // Display the gift description
                trailing: Text('\$${gift.price.toStringAsFixed(2)}'), // Display the gift price
              );
            },
          ),
        ),
      ],
    ),
  ]
  )); */
  
}
}

import 'package:flutter/material.dart';

class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({Key? key}) : super(key: key);

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

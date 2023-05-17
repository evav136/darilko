import 'package:flutter/material.dart';
import 'package:darilko/screens/catalogue_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Darilko',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 227, 102, 229),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                            builder: (context) => const CatalogueScreen()),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Podari darilo svojemu najbližnjemu. ',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Izberi priložnost: ',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
      
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            //Center(
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
                    const SizedBox(width: 8),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
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
                  ],
                ),
              ),
              Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Darilko je odlična izbira za tiste, ki iščejo prilagojena darila za svoje najbližje. ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          
            ],
          ),
        ),

        ]
      )        
    );
  }
}


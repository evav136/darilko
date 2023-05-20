import 'package:flutter/material.dart';
import 'package:darilko/entities/gift.dart';
import 'package:darilko/entities/order.dart';

class GiftScreen extends StatefulWidget {
  final Gift gift;

  const GiftScreen({Key? key, required this.gift}) : super(key: key);

  @override
  _GiftScreenState createState() => _GiftScreenState();
}

class _GiftScreenState extends State<GiftScreen> {
  bool _isInStock = true;
  String _email = '';
  Order _order = Order(); // Create an instance of the Order entity

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opis'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(widget.gift.picturePath),
              ),
            ),
            SizedBox(height: 16),
            Text(
              widget.gift.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              widget.gift.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Cena: \$${widget.gift.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Kategorije: ${widget.gift.filter}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            if (_isInStock)
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    _order.addGift(widget.gift); // Add the gift to the order
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Darilo dodano k naročilu!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Dodaj k naročilu'),
                ),
              )
            else
              Column(
                children: [
                  Text(
                    'Darila ni na zalogi. Če želite prejeti obvestilo o obnovitvi zaloge, vnesite svoj e-poštni naslov:',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        _email = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'E-pošta',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Hvala za vaš interes!'),
                              content: Text(
                                  'Obvestili vas bomo, ko bo darilo ponovno na zalogi.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text('Pošlji'),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

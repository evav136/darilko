import 'package:flutter/material.dart';
import 'package:darilko/entities/gift.dart';
import 'package:darilko/entities/order.dart';
import 'package:darilko/screens/order_screen.dart';

class GiftScreen extends StatefulWidget {
  final Gift gift;

  const GiftScreen({Key? key, required this.gift}) : super(key: key);

  @override
  _GiftScreenState createState() => _GiftScreenState();
}

class _GiftScreenState extends State<GiftScreen> {
  bool _orderViewed = false;
  bool _isInStock = false;
  String _email = '';
  Order _order = Order(); // Create an instance of the Order entity
  final TextEditingController _emailController = TextEditingController();

  void _navigateToOrderScreen() async {
    // Navigate to the order screen and wait for the result
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => OrderScreen(
                order: _order,
              )),
    );

    if (result != null && result == 'order_completed') {
      setState(() {
        _orderViewed = true;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    checkStock(); // Call the method to check gift stock
  }

  void checkStock() {
    if (widget.gift.stock > 0) {
      // Check if there is at least one gift in stock
      setState(() {
        _isInStock = true; // Set _isInStock to true if gift is in stock
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Podrobnosti'),
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
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              widget.gift.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Cena: \€${widget.gift.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Priložnost: ${widget.gift.filter}',
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            OrderScreen(order: _order)));
                              },
                              child: Text('Preglej naročilo'),
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
                    controller: _emailController,
                    onChanged: (value) {
                      setState(() {
                        _email = value;
                      });
                    },
                    //inputFormatters: [
                    //FilteringTextInputFormatter.deny(RegExp('')), // Allow only input with '@' symbol
                    //],
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

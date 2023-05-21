import 'package:darilko/services/isar_service.dart';
import 'package:flutter/material.dart';
import 'package:darilko/entities/order.dart';
import 'package:flutter/services.dart';
import 'package:darilko/entities/gift.dart';

class PaymentScreen extends StatefulWidget {
  final Order order;

  const PaymentScreen({Key? key, required this.order}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _receiverNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _payerNameController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  Gift? gift;

  @override
  void initState() {
    super.initState();
    retrieveGift(); // Call the method to retrieve the gift
  }

  void retrieveGift() async {
    // final isarService = IsarService();
    final gift = await IsarService().getGiftById(widget.order.giftId);
    setState(() {
      this.gift = gift;
    });
  }

  @override
  void dispose() {
    _receiverNameController.dispose();
    _addressController.dispose();
    _payerNameController.dispose();
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  void _submitPayment() async {
    if (_formKey.currentState?.validate() ?? true) {
      // Payment validation and processing logic goes here

      // Create an instance of IsarService
      final isarService = IsarService();

      // Save the updated order to the database
      isarService.saveOrder(widget.order);
      widget.order.paidFor = true;

      // Decrement the stock of the gift
      if (gift != null) {
        gift!.stock -= 1;
        await isarService.saveGift(gift!);
      }

      _showSuccessNotification();
    }
  }

  void _showSuccessNotification() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor:
              Colors.transparent, // Make the dialog background transparent
          content: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Add any exciting and animated widgets you want to display
                // For example, you can use AnimatedContainer, AnimatedBuilder, or any other custom animated widget
                Text(
                  'Success!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Icon(
                  Icons.check_circle,
                  size: 48,
                  color: Colors.green,
                ),
                SizedBox(height: 16),
                Text(
                  'Vaše naročilo je bilo uspešno oddano!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Plačilo'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/',
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        if (gift != null)
                          Image.asset(
                            gift!.picturePath,
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                          ),
                      ],
                    ),
                  ),
                  SizedBox(width: 14),
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(100, 255, 200, 246),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (gift != null)
                            Text(
                              gift!.name,
                              style: TextStyle(fontSize: 16),
                            ),
                          SizedBox(height: 8),
                          if (gift != null)
                            Text(
                              'Cena: ${gift!.price.toStringAsFixed(2)}€',
                              style: TextStyle(fontSize: 16),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Podatki prejemnika',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 14),
              TextFormField(
                controller: _receiverNameController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Vnesite ime prejemnika';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Ime in priimek',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _addressController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Vnesite naslov prejemnika';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Naslov',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Podatki plačnika',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 14),
              TextFormField(
                controller: _payerNameController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Vnesite ime plačnika';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Ime in priimek',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _cardNumberController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Vnesite številko kreditne kartice';
                  }
                  if (value?.length != 16) {
                    return 'Številka kartice mora vsebovati 16 števk';
                  }
                  if (!value!.contains(RegExp(r'^[0-9]+$'))) {
                    return 'Vnesite samo števke brez presledkov';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Štetevilka kreditne kartice',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _expiryDateController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Vnesite datum veljavnosti';
                        }
                        if (!RegExp(r'^\d{2}/\d{2}/\d{2}$').hasMatch(value!)) {
                          return 'Vnesite veljaven datum (DD/MM/YY)';
                        }
                        final parts = value.split('/');
                        final day = int.tryParse(parts[0]);
                        final month = int.tryParse(parts[1]);
                        final year = int.tryParse(parts[2]);
                        if (day == null || month == null || year == null) {
                          return 'Vnesite veljaven datum (DD/MM/YY)';
                        }
                        if (day < 1 || day > 31) {
                          return 'Neveljaven dan';
                        }
                        if (month < 1 || month > 12) {
                          return 'Neveljaven mesec';
                        }
                        if (year < 23 || year > 99) {
                          return 'Neveljaven letnik';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Datum veljavnosti (DD/MM/YY)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: _cvvController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Vnesite CVV kodo';
                        }
                        if (value!.length != 3) {
                          return 'CVV koda mora vsebovati 3 števke';
                        }
                        if (!value.contains(RegExp(r'^[0-9]+$'))) {
                          return 'Vnesite samo števke';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'CVV',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _submitPayment,
                child: Text('Potrdi plačilo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:darilko/entities/order.dart';
import 'package:flutter/services.dart';

class PaymentScreen extends StatefulWidget {
  final Order order;

  const PaymentScreen({Key? key, required this.order}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  void _submitPayment() {
    if (_formKey.currentState?.validate() ?? false) {
      // Payment validation and processing logic goes here
      _showSuccessNotification();
    }
  }

  void _showSuccessNotification() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Vaše naročilo je bilo uspešno oddano!',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plačilo'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Podatki prejemnika',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Vnesite ime prejemnika';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Ime',
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
                SizedBox(height: 24),
                Text(
                  'Podatki plačnika',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
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
                          if (!RegExp(r'^\d{2}/\d{2}/\d{2}$')
                              .hasMatch(value!)) {
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
                          if (year < 0 || year > 99) {
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
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _submitPayment,
                  child: Text('Potrdi plačilo'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

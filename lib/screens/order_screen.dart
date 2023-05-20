import 'package:flutter/material.dart';
import 'package:darilko/entities/order.dart';
import 'package:darilko/screens/payment_screen.dart';

class OrderScreen extends StatelessWidget {
  final Order order;

  const OrderScreen({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final giftList = order.gifts.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Vaše naročilo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: order.gifts.length,
                itemBuilder: (context, index) {
                  final gift = giftList[index];
                  return ListTile(
                    leading: Container(
                      width: 50, // Adjust the width as per your requirement
                      height: 50, // Adjust the height as per your requirement
                      child: Image.asset(gift.picturePath),
                    ),
                    title: Text(gift.name),
                    subtitle: Text('Cena: €${gift.price.toStringAsFixed(2)}'),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Skupna cena: €${order.total.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate back to the catalogue screen
                    Navigator.pop(context);
                  },
                  child: Text('Nadaljuj z nakupovanjem'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the payment screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentScreen(order: order),
                      ),
                    );
                  },
                  child: Text('Nadaljuj na plačilo'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

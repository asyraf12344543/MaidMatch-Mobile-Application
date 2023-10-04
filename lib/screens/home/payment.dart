import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formKey = GlobalKey<FormState>();
  final _cardNumber = TextEditingController();
  final _expiryDate = TextEditingController();
  final _cvvCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Payment"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _cardNumber,
                decoration: InputDecoration(labelText: 'Card Number'),
                validator: (value) {
                  if (value== null || value.trim().isEmpty) {
                    return 'Please enter a card number';
                  }
                  return null;
                },
                onSaved: (value) => _cardNumber.text = value ??"",
              ),
              TextFormField(
                controller: _expiryDate,
                decoration: InputDecoration(labelText: 'Expiry Date'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter an expiry date';
                  }
                  return null;
                },
                onSaved: (value) => _expiryDate.text = value ??"",
              ),
              TextFormField(
                controller: _cvvCode,
                decoration: InputDecoration(labelText: 'CVV Code'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a CVV code';
                  }
                  return null;
                },
                onSaved: (value) => _cvvCode.text = value ??"",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {

                  },
                  child: Text('Submit Payment'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
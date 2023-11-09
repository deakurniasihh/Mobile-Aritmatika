import 'package:flutter/material.dart';

class Uang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Currency Converter'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: CurrencyConverter(),
      ),
    );
  }
}

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  double usdToEuro = 0.86; // Kurs USD ke EUR

  TextEditingController usdController = TextEditingController();
  TextEditingController euroController = TextEditingController();

  void convertCurrency() {
    try {
      double usdAmount = double.parse(usdController.text);
      double euroAmount = usdAmount * usdToEuro;
      euroController.text = euroAmount.toStringAsFixed(2);
    } catch (e) {
      euroController.text = 'Invalid input';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: usdController,
              decoration: InputDecoration(
                labelText: 'USD',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: convertCurrency,
              child: Text('Convert'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: euroController,
              decoration: InputDecoration(
                labelText: 'Euro (EUR)',
                border: OutlineInputBorder(),
              ),
              readOnly: true,
            ),
          ],
        ),
      ),
    );
  }
}

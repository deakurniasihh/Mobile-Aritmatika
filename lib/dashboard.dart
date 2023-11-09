import 'package:flutter/material.dart';
import 'package:latihan/Passing.dart';
import 'package:latihan/bmi.dart';
import 'package:latihan/calculator.dart';
import 'package:latihan/suhu.dart';
import 'package:latihan/uang.dart';

void main() {
  runApp(MaterialApp(
    home: Dashboard(),
    debugShowCheckedModeBanner: false,
  ));
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DashboardButton(
                    title: 'Uang',
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Uang();
                      }));
                      print('Tombol Uang ditekan');
                    },
                  ),
                  DashboardButton(
                    title: 'BMI',
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return BMICalculator();
                      }));
                      print('Tombol BMI ditekan');
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DashboardButton(
                    title: 'Suhu',
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return TemperatureConverterApp();
                      }));
                      print('Tombol Suhu ditekan');
                    },
                  ),
                  DashboardButton(
                    title: 'Calculator',
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CalculatorApp();
                      }));
                      print('Tombol Calculator ditekan');
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DashboardButton(
                    title: 'Nama', // Tombol Database
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return InputNamePage(); // Ganti dengan halaman Database yang sesuai
                      }));
                      print('Tombol nama ditekan');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback? onPressed;

  DashboardButton({
    required this.title,
    required this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          primary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class InputNamePage extends StatefulWidget {
  @override
  _InputNamePageState createState() => _InputNamePageState();
}

class _InputNamePageState extends State<InputNamePage> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Name Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Enter your name:'),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: nameController,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DisplayNamePage(name),
                  ),
                );
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class DisplayNamePage extends StatelessWidget {
  final String name;

  DisplayNamePage(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Name Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Hello, $name!'),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Name App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: InputNamePage(),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widgets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Atividade Widgets'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String initialDate = '';
  String finalDate = '';
  String inputSign = '';

  void verify() {
    if (inputSign.length != 0) {
      switch (inputSign) {
        case 'aries':
          setState(() {
            initialDate = '21 de março';
            finalDate = '20 de abril';
          });
          break;
        case 'touro':
          setState(() {
            initialDate = '21 de abril';
            finalDate = '20 de maio';
          });
          break;
        case 'gemeos':
          setState(() {
            initialDate = '21 de maio';
            finalDate = '20 de junho';
          });
          break;
        default:
          setState(() {
            initialDate = '';
            finalDate = '';
          });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Digite seu signo',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Insira seu signo aqui...',
                  border: UnderlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    inputSign = value;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: ElevatedButton(
                child: const Text('Verificar'),
                onPressed: verify,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: Text(
                'Você nasceu entre os dias $initialDate e $finalDate',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

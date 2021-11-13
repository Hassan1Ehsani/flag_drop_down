import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class country {
  String name;
  Image icon;
  country(this.name, this.icon);
}

class _MyHomePageState extends State<MyHomePage> {
  List countries = [
    country("Canada", Image.asset("assets/canada.png")),
    country("Eng", Image.asset("assets/eng.png")),
    country("USA", Image.asset("assets/usa.png"))
  ];
  var chosenValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: SafeArea(
          child: DropdownButton(
        hint: Text("Please Select you Country"),
        value: chosenValue,
        items: countries.map((country) {
          return DropdownMenuItem(
              value: country,
              child: Row(
                children: [
                  country.icon,
                  SizedBox(width: 20),
                  Text(country.name),
                ],
              ));
        }).toList(),
        onChanged: (value) {
          setState(() {
            chosenValue = value;
          });
        },
      )),
    );
  }
}

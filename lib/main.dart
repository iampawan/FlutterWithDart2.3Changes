import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> texts;
  bool isIOS = defaultTargetPlatform == TargetPlatform.iOS;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print(texts.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    texts = [
      Text("Monday"),
      Text("Tuesday"),
      Text("Wednesday"),
    ];

    var header = Text(
      "Weekdays",
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );

    var footer = Text(
      "End",
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Dart 2.3 UI"),
      ),
      body: Center(
        child: Column(
          children: [
            header,
            ...texts,
            if (isIOS) ...[
              Icon(CupertinoIcons.add),
              Icon(CupertinoIcons.back),
              Icon(CupertinoIcons.battery_25_percent),
            ] else ...[
              Icon(Icons.add),
              Icon(Icons.arrow_back),
              Icon(Icons.battery_charging_full),
            ],
            for (var x in [
              Text("Thursday"),
              Text("Friday"),
              Text("Saturday"),
              Text("Sunday")
            ])
              if (x.data.startsWith("S")) x,
          ],
        ),
      ),
    );
  }
}

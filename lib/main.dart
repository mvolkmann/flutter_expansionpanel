import 'package:flutter/material.dart';

const title = 'My App';

void main() => runApp(
      MaterialApp(
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
      ),
    );

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final panelOpen = <bool>[false, false];

  @override
  Widget build(BuildContext context) {
    final panels = [
      buildPanel(0, 'First', 'This is the first panel.'),
      buildPanel(1, 'Second', 'This is the second panel.'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: ExpansionPanelList(
            children: panels,
            expansionCallback: (index, isOpen) {
              setState(() => panelOpen[index] = !isOpen);
            },
          ),
        ),
      ),
    );
  }

  ExpansionPanel buildPanel(int index, String header, String body) =>
      ExpansionPanel(
        headerBuilder: (_, isOpen) {
          final color = isOpen ? Colors.green : Colors.red;
          return Text(header, style: TextStyle(color: color));
        },
        body: Text(body),
        isExpanded: panelOpen[index],
      );
}

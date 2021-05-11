import 'package:flutter/material.dart';

void main() {
  runApp(DndRoller());
}

class DndRoller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.deepPurple),
      title: 'D&D Roller',
      home: RollScreen(),
    );
  }
}

class RollScreen extends StatefulWidget {
  @override
  _RollScreenState createState() => _RollScreenState();
}

class _RollScreenState extends State<RollScreen> {
  String rollButton = 'Roll';
  void onPressed() {
    rollButton = 'Rolled!';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('D&D Roller'), centerTitle: true),
        body: Column(children: <Widget>[
          Text('Input a modifier'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildPanel(),
          ),
          ElevatedButton(onPressed: onPressed, child: Text(rollButton)),
        ]));
  }
}

Widget _buildPanel() {
  return ExpansionPanelList(
    children: [
      ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text('Choose a die'),
            );
          },
          body: ListTile(
            title: Text('d20'),
          ))
    ],
  );
}

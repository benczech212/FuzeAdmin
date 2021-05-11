import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'USEFUZE Admin Suite';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Colors.purple[800],
        accentColor: Colors.cyan[600],

        // Define the default font family.
        fontFamily: 'Roboto',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Roboto'),
        ),
      ),
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(child: Text('page body')),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
        
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
              Colors.purple.shade600.withAlpha(100),
              Colors.black
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: ListView(
              // Important: Remove any padding from the ListView.

              padding: EdgeInsets.zero,
              children: <Widget>[
                drawerHeader(),
                ListTile(
                  title: Text('Dashboard'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Search Tags'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ));
  }

  Widget ufLogo() {
    return Container(
      //color: Colors.white.withAlpha(64),
      child: Image(
        image: AssetImage('assets/images/uf_icon_white.png'),
        width: 50,
        height: 50,
      ),
    );
  }

  Widget drawerHeader() {
    return DrawerHeader(
        child: Container(
            child: Column(
          children: [
            Row(children: [
              ufLogo(),
              Expanded(
                  child: Column(children: [
                Text(
                  "USEFUZE",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Text(
                  "Admin Suite",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.left,
                )
              ]))
            ]),
            Row()
          ],
        )),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
              Colors.purple.shade300.withAlpha(100),
              Colors.purple.shade400.withAlpha(100),
            ])));
  }
}

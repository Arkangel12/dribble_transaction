import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Base'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final peach = const Color(0xFFff9999);
  final lightpink = const Color(0xFFff66b2);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return appBody(context);
  }

  Widget bottomAppBarContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.calendar_today),
          onPressed: () {},
          color: lightpink.withOpacity(0.7),
        ),
        IconButton(
          icon: Icon(Icons.insert_chart),
          onPressed: () {},
          color: Colors.white70,
        ),
        IconButton(
          icon: Icon(Icons.person),
          onPressed: () {},
          color: Colors.white70,
        ),
      ],
    );
  }

  Widget appBody(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple,
              Colors.black87,
            ],
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -250.0,
              left: -65.0,
              child: Container(
                transform: Matrix4.rotationZ(.5),
                width: 500.0,
                height: 400.0,
                alignment: FractionalOffset(-100.0, -100.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30 * pi)),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [lightpink, peach],
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: size.width,
                    height: 75.0,
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20.0, bottom: 20.0),
                        child: Text(
                          'Classify transaction',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20.0, bottom: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Classify this transaction into a',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14.0),
                            ),
                            Text(
                              'particular category',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14.0),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  menuCards(size),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white70.withOpacity(0.1),
        child: bottomAppBarContent(),
      ),
    );
  }

  Widget menuCards(Size size) {
    BoxDecoration decoration = BoxDecoration(
      color: Colors.black26,
      borderRadius: BorderRadius.circular(20.0),
    );

    final double _cardHeight = size.height / 4 - 30.0;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      width: size.width - 20.0,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  width: size.width / 2 - 30,
                  height: _cardHeight,
                  decoration: decoration,
                  child: cardContent(
                      Colors.blueAccent, Icons.view_module, 'General'),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  width: size.width / 2 - 30,
                  height: _cardHeight,
                  decoration: decoration,
                  child: cardContent(
                      Colors.deepPurple, Icons.directions_transit, 'Transport'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  width: size.width / 2 - 30,
                  height: _cardHeight,
                  decoration: decoration,
                  child: cardContent(
                      Colors.pinkAccent, Icons.shopping_basket, 'Shopping'),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  width: size.width / 2 - 30,
                  height: _cardHeight,
                  decoration: decoration,
                  child: cardContent(Colors.deepOrangeAccent,
                      Icons.insert_drive_file, 'Bills'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  width: size.width / 2 - 30,
                  height: _cardHeight,
                  decoration: decoration,
                  child: cardContent(Colors.blue, Icons.movie, 'Entertaiment'),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  width: size.width / 2 - 30,
                  height: _cardHeight,
                  decoration: decoration,
                  child: cardContent(
                      Colors.lightGreen, Icons.local_grocery_store, 'Grocery'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget cardContent(Color color, IconData iconName, String name) {
    BoxDecoration boxDecoration = BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [color.withOpacity(.6), color],
        ));

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 75.0,
          height: 75.0,
          decoration: boxDecoration,
          child: Center(
            child: Icon(
              iconName,
              size: 42.0,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          name,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ProductProvider.dart';
import 'package:nice_button/nice_button.dart';
import './mainscreen.dart';

class HomePage extends StatelessWidget {
  static final routeName = '/homepage';

  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<Products>(context);
    final alucard = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(
              'https://instagram.fcok4-1.fna.fbcdn.net/v/t51.2885-19/s150x150/56219747_414475592463974_6654386401573863424_n.jpg?_nc_ht=instagram.fcok4-1.fna.fbcdn.net&_nc_ohc=DoZdBLzVMq4AX8PN2hJ&oh=0bffd2248a5673a0164a3c41e33e186a&oe=5EA406BD'),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Welcome ${prod.username}',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Welcome to ShopEazy, Start building your Website right away!!!!',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    final button = NiceButton(
      background: null,
      radius: 40,
      padding: const EdgeInsets.all(15),
      text: "Continue",
      icon: Icons.arrow_right,
      gradientColors: [Colors.amberAccent, Colors.amber],
      onPressed: () =>
          Navigator.of(context).pushReplacementNamed(Mainscrn.routeName),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.purple,
          Colors.purpleAccent,
        ]),
      ),
      child: Column(
        children: <Widget>[alucard, welcome, lorem],
      ),
    );

    return Scaffold(
      floatingActionButton: button,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: body,
    );
  }
}

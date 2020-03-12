import 'package:flutter/material.dart';
import './loginscreen.dart';
import '../providers/ProductProvider.dart';
import 'package:provider/provider.dart';
import '../screens/productBoxListScreen.dart';

//import './about.dart';

class Mainscrn extends StatelessWidget {
  static final routeName = '/mainscrn';
  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<Products>(context);
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1582247854288-d12c8a2d9acb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80'),
                    fit: BoxFit.cover))),
        Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              SizedBox(
                height: 50,
              ),
              FlatButton(
                child: Text(
                  'CREATE / MANAGE A WEBSITE',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 38),
                ),
                onPressed: () =>
                    Navigator.of(context).pushNamed(ProdListScreen.routeName),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                child: Text(
                  'LOGOUT',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 38),
                ),
                onPressed: () => Navigator.of(context)
                    .pushReplacementNamed(LoginPage.routeName),
              ),
            ])),
      ]),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Container(
              child: Text(
                'Welcome ${prod.username}',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Segoe',
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () => {},
              //Navigator.of(context).pushNamed(Login2.routeName),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'How to Use ',
                  style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'Segoe',
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'About',
                style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Segoe',
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (int selectedValue) =>
                Navigator.of(context).pushReplacementNamed(LoginPage.routeName),
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Log Out'),
                value: 0,
              ),
            ],
          )
        ],
      ),
    );
  }
}

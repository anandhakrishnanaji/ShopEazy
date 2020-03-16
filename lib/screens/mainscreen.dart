import 'package:flutter/material.dart';
import './loginscreen.dart';
import '../providers/ProductProvider.dart';
import 'package:provider/provider.dart';
import './productBoxListScreen.dart';
import './aboutscreen.dart';

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
                    image: const NetworkImage(
                        'https://images.unsplash.com/photo-1582247854288-d12c8a2d9acb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80'),
                    fit: BoxFit.cover))),
        Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              const SizedBox(
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
              const SizedBox(
                height: 40,
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
            const SizedBox(
              height: 50,
            ),
            Container(
              child: Text(
                'Welcome ${prod.username}',
                style: const TextStyle(
                  fontSize: 30,
                  fontFamily: 'Segoe',
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(Login2.routeName),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  'How to Use ',
                  style: const TextStyle(
                      fontSize: 28,
                      fontFamily: 'Segoe',
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: const Text(
                'About',
                style: const TextStyle(
                    fontSize: 28,
                    fontFamily: 'Segoe',
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (int selectedValue) {
              if (selectedValue == 0)
                Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
              else {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          actions: <Widget>[
                            FlatButton(
                              child: Text(
                                'OK',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                              onPressed: () => Navigator.of(context).pop(),
                            )
                          ],
                          title: Text(
                            "Your Site link",
                            textAlign: TextAlign.center,
                          ),
                          content: SelectableText(
                            "192.168.1.22/Eshopper/index.php?username=${prod.username}",
                            textAlign: TextAlign.center,
                          ),
                          contentPadding: EdgeInsets.all(60.0),
                         // shape: CircleBorder(),
                        ));
              }
            },
            icon: const Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: const Text('Log Out'),
                value: 0,
              ),
              PopupMenuItem(
                child: const Text('View your Website'),
                value: 1,
              ),
            ],
          )
        ],
      ),
    );
  }
}

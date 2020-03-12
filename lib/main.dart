import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/loginButtonScreen.dart';
import './screens/RegistrationScreen.dart';
import './providers/ProductProvider.dart';
import './screens/loginscreen.dart';
import './screens/homepage.dart';
import './screens/mainscreen.dart';
import './screens/productBoxListScreen.dart';
import './screens/productovrscreen.dart';
import './screens/producteditscreen.dart';
import './screens/aboutscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: Products()),
        ],
        child: MaterialApp(
          title: 'Shop',
          routes: {
            '/': (ctx) => Login1(),
            RegistrationScreen.routeName: (ctx) => RegistrationScreen(),
            Login1.routeName: (ctx) => Login1(),
            LoginPage.routeName: (ctx) => LoginPage(),
            HomePage.routeName: (ctx) => HomePage(),
            Mainscrn.routeName: (ctx) => Mainscrn(),
            ProdListScreen.routeName: (ctx) => ProdListScreen(),
            ProductDetail.routeName: (ctx) => ProductDetail(),
            EditProductScreen.routeName: (ctx) => EditProductScreen(),
            Login2.routeName: (ctx) => Login2()
          },
          theme: ThemeData(
              primarySwatch: Colors.purple,
              accentColor: Colors.amber,
              fontFamily: 'Segoe'),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ProductProvider.dart';

class ProductDetail extends StatelessWidget {
  static final routeName = '/productdetail';
  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<Products>(context);
    final id = ModalRoute.of(context).settings.arguments;
    final loadedProduct = prod.item.firstWhere((val) => val.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: 300,
                padding: EdgeInsets.all(20),
                child: Image.network(loadedProduct.image),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  '${loadedProduct.name}             \$${loadedProduct.price.toString()}',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                  textAlign: TextAlign.start,
                ),
              ),
              Text(
                'Description',
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(loadedProduct.description),
                height: 200,
                width: 200,
              ),
              Text('Genre : ${loadedProduct.genre}')
            ],
          ),
        ),
      ),
    );
  }
}

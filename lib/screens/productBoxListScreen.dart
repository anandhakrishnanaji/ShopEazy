import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ProductProvider.dart';
import '../widgets/ProductBox.dart';
import './producteditscreen.dart';

class ProdListScreen extends StatefulWidget {
  static final routeName = '/prodlistscrn';

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<ProdListScreen> {
  var _isinit = true;
  @override
  void didChangeDependencies() {
    if (_isinit) var a = Provider.of<Products>(context).getProducts();
    _isinit = false;
    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    final prod = Provider.of<Products>(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => Navigator.of(context)
              .pushNamed(EditProductScreen.routeName, arguments: null),
        ),
        appBar: AppBar(
          title: const Text('Create / Manage Product'),
        ),
        body: (prod.item.length <= 0)
            ? const Text(
                'No Products Added',
                style: TextStyle(fontSize: 30),
              )
            : ListView.builder(
                itemCount: prod.item.length,
                itemBuilder: (ctx, index) => ProductBox(prod.item[index].id)));
  }
}

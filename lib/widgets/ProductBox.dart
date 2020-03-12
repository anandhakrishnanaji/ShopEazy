import 'package:flutter/material.dart';
import '../providers/ProductProvider.dart';
import 'package:provider/provider.dart';
import '../screens/productovrscreen.dart';
import '../screens/producteditscreen.dart';

class ProductBox extends StatelessWidget {
  final id;
  ProductBox(
    this.id,
  );
  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<Products>(context);
    final loadedProd = prod.item.firstWhere((item) => item.id == id);
    return ListTile(
      leading: CircleAvatar(
        child: GestureDetector(
            onTap: () => Navigator.of(context)
                .pushNamed(ProductDetail.routeName, arguments: id),
            child: Image.network(loadedProd.image)),
        radius: 15,
      ),
      title: Text(loadedProd.name),
      subtitle: Text(loadedProd.price.toString()),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => Navigator.of(context)
                    .pushNamed(EditProductScreen.routeName, arguments: id)),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => prod.delProducts(id),
            )
          ],
        ),
      ),
    );
  }
}

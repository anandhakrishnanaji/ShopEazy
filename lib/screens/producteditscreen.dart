import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ProductProvider.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/editproduct';
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedProduct = Product(
    id: null,
    name: '',
    price: 0,
    description: '',
    image: ' ',
    genre: ' ',
    username: '',
  );

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<Products>(context);
    void _saveForm() {
      _form.currentState.save();
      /*print(_editedProduct.name);
    print(_editedProduct.description);
    print(_editedProduct.price);
    print(_editedProduct.image);
    print(_editedProduct.genre);
    print(_editedProduct.username);*/
      if (_editedProduct.id == null)
        prod.addProduct(_editedProduct);
      else
        prod.editProduct(_editedProduct);
      Navigator.of(context).pop();
    }

    final id = ModalRoute.of(context).settings.arguments;
    if (id != null)
      _editedProduct = prod.item.firstWhere((val) => val.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                initialValue: _editedProduct.name,
                decoration: InputDecoration(labelText: 'Name'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                onSaved: (value) {
                  _editedProduct = Product(
                    name: value,
                    price: _editedProduct.price,
                    description: _editedProduct.description,
                    image: _editedProduct.image,
                    id: _editedProduct.id,
                    genre: _editedProduct.genre,
                    username: prod.username,
                  );
                },
              ),
              TextFormField(
                initialValue: _editedProduct.price.toString(),
                decoration: InputDecoration(labelText: 'Price'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                onSaved: (value) {
                  _editedProduct = Product(
                    name: _editedProduct.name,
                    price: int.parse(value),
                    description: _editedProduct.description,
                    image: _editedProduct.image,
                    id: _editedProduct.id,
                    genre: _editedProduct.genre,
                    username: prod.username,
                  );
                },
              ),
              TextFormField(
                initialValue: _editedProduct.description,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
                onSaved: (value) {
                  _editedProduct = Product(
                    name: _editedProduct.name,
                    price: _editedProduct.price,
                    description: value,
                    image: _editedProduct.image,
                    id: _editedProduct.id,
                    genre: _editedProduct.genre,
                    username: prod.username,
                  );
                },
              ),
              TextFormField(
                initialValue: _editedProduct.genre,
                decoration: InputDecoration(labelText: 'Genre'),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  _editedProduct = Product(
                    name: _editedProduct.name,
                    price: _editedProduct.price,
                    description: _editedProduct.description,
                    image: _editedProduct.image,
                    id: _editedProduct.id,
                    genre: value,
                    username: prod.username,
                  );
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 8,
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    child: _imageUrlController.text.isEmpty
                        ? Text('Enter a URL')
                        : FittedBox(
                            child: Image.network(
                              _imageUrlController.text,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      //initialValue: _editedProduct.image,
                      decoration: InputDecoration(labelText: 'Image URL'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageUrlController,
                      focusNode: _imageUrlFocusNode,
                      onFieldSubmitted: (_) {
                        _saveForm();
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                          name: _editedProduct.name,
                          price: _editedProduct.price,
                          description: _editedProduct.description,
                          image: value,
                          id: _editedProduct.id,
                          genre: _editedProduct.genre,
                          username: prod.username,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

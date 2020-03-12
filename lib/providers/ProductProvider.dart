import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Product {
  final int id;
  final String username;
  final String name;
  final String description;
  final int price;
  final String image;
  final String genre;
  Product(
      {this.id,
      this.username,
      this.description,
      this.genre,
      this.price,
      this.image,
      this.name});
  /* factory Product.fromJson(Map json) {
    print(json["id"]);
    return new Product(
        id: json["id"] as int,
        name: json["name"],
        description: json["description"] as String,
        genre: json["genre"] as String,
        username: json["username"] as String,
        image: json["image"] as String,
        price: json["price"] as int);
  }*/
}

class Products with ChangeNotifier {
  List<Product> _item = [];

  List<Product> get item {
    return [..._item];
  }

  String _username = 'helo';

  String get username {
    return _username;
  }

  void toProduct(List jsonn) {
    //print('hi');
    List k = [];
    for (var u in jsonn) {
      //print(u['name']);
      Product j = new Product(
          id: int.parse(u['id']),
          description: u['description'],
          genre: u['genre'],
          image: u['image'],
          name: u['name'],
          price: int.parse(u['price']),
          username: _username);
      k.add(j);
    }
    _item = [...k];
    notifyListeners();
  }

  Future<String> addUser(
      {String firstName,
      String lastName,
      String username,
      String shopnamee,
      int phoneno,
      String password,
      String emaill}) async {
    try {
      // print('hi');
      const url = 'http://192.168.1.22/shop/register.php';
      var response = await http.post(url, body: {
        "fname": firstName,
        "username": username,
        "lname": lastName,
        "email": emaill,
        "mobile": phoneno.toString(),
        "shopname": shopnamee,
        "password": password
      });
      if (response.statusCode == 200) {
        // print(response.body);
        _username = username;
        notifyListeners();
        return response.body;
      } else
        return "error";
    } catch (e) {
      return "error";
    }
  }

  Future<String> loginUser({String username, String password}) async {
    try {
      const url = 'http://192.168.1.22/shop/login.php';
      var response = await http
          .post(url, body: {"username": username, "password": password});
      if (response.statusCode == 200) {
        //print(response.body);
        _username = username;
        notifyListeners();
        return response.body;
      } else
        return "error";
    } catch (e) {
      return "error";
    }
  }

  Future<String> getProducts() async {
    try {
      const url = 'http://192.168.1.22/shop/loginn.php';
      var response = await http
          .post(url, body: {"action": "CREMAN", "username": username});
      if (response.statusCode == 200) {
        var jsonn = json.decode(response.body);
       // print(jsonn);
        toProduct(jsonn);
        return "Success";
      } else
        return "error";
    } catch (e) {
      return "error";
    }
  }

  Future<String> delProducts(int id) async {
    try {
      const url = 'http://192.168.1.22/shop/loginn.php';
      var response = await http
          .post(url, body: {"action": "PRODUCTDEL", "id": id.toString()});
      print(response.body);
      if (response.body == "success") {
        _item.removeWhere((val) => val.id == id);
        print("hello");
      }
      notifyListeners();
      return "Success";
    } catch (e) {
      return "error";
    }
  }

  Future<String> addProduct(Product value) async {
    try {
      const url = 'http://192.168.1.22/shop/loginn.php';
      var response = await http.post(url, body: {
        "action": "ADDPRODUCT",
        "username": _username,
        "name": value.name,
        "description": value.description,
        "price": value.price.toString(),
        "image": value.image,
        "genre": value.genre
      });
      print(response.body);
      getProducts();
      return response.body;
    } catch (e) {
      return "error";
    }
  }

  Future<String> editProduct(Product value) async {
    try {
      const url = 'http://192.168.1.22/shop/loginn.php';
      var response = await http.post(url, body: {
        "action": "PRODUCTEDIT",
        "id": value.id.toString(),
        "name": value.name,
        "description": value.description,
        "price": value.price.toString(),
        "image": value.image,
        "genre": value.genre
      });
      print(response.body);
      getProducts();
      return response.body;
    } catch (e) {
      return "error";
    }
  }
}

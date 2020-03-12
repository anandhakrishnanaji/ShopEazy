import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:p1/providers/ProductProvider.dart';
import 'package:provider/provider.dart';
import './homepage.dart';

class RegistrationScreen extends StatefulWidget {
  static final routeName = '/regscrn';
  static final form = GlobalKey<FormState>();

  @override
  RegistrationScreenState createState() => new RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController uname = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController shopname = TextEditingController();
  TextEditingController pno = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<Products>(context);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Sign Up'),
      ),
      body: Stack(children: <Widget>[
        Container(
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: const NetworkImage(
                        'https://images.unsplash.com/photo-1529000920031-b8f994d2eb27?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                    fit: BoxFit.cover))),
        new SafeArea(
            top: false,
            bottom: false,
            child: new Form(
                key: RegistrationScreen.form,
                autovalidate: true,
                child: new ListView(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10),
                  children: <Widget>[
                    new TextFormField(
                      controller: uname,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.account_circle),
                        hintText: 'Enter your username',
                        labelText: 'Username',
                      ),
                    ),
                    new TextFormField(
                      controller: fname,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.person),
                        hintText: 'Enter your first name',
                        labelText: 'First Name',
                      ),
                    ),
                    new TextFormField(
                      controller: lname,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.calendar_today),
                        hintText: 'Enter your last name',
                        labelText: 'Last Name',
                      ),
                    ),
                    new TextFormField(
                      controller: shopname,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.shopping_cart),
                        hintText: 'Enter your Shop name',
                        labelText: 'Store name',
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    new TextFormField(
                      controller: pno,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.phone),
                        hintText: 'Enter a phone number',
                        labelText: 'Phone',
                      ),
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                    ),
                    new TextFormField(
                      controller: email,
                      decoration: const InputDecoration(
                          icon: const Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          hintText: 'Enter a email address',
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    new TextFormField(
                      controller: password,
                      decoration: const InputDecoration(
                          icon: const Icon(Icons.email, color: Colors.white),
                          hintText: 'Enter password',
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    new Container(
                        padding: const EdgeInsets.only(top: 20.0, left: 250),
                        child: new FlatButton(
                          child: const Text(
                            'SIGN UP',
                            style:
                                TextStyle(fontSize: 25, color: Colors.purple),
                          ),
                          onPressed: () {
                            //   saveform();

                            String username = uname.text;
                            String fullname = fname.text;
                            String lastname = lname.text;
                            String emailad = email.text;
                            String shopnamee = shopname.text;
                            int phoneno = int.parse(pno.text);
                            String pass = password.text;
                            var a = prod.addUser(
                                username: username,
                                firstName: fullname,
                                lastName: lastname,
                                emaill: emailad,
                                shopnamee: shopnamee,
                                phoneno: phoneno,
                                password: pass);
                            a.then((val) {
                              print(val);
                              if (val == 'Success')
                                Navigator.of(context)
                                    .pushReplacementNamed(HomePage.routeName);
                            });
                          },
                        )),
                  ],
                ))),
      ]),
    );
  }
}

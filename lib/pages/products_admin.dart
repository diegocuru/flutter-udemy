import 'package:flutter/material.dart';

import './products.dart';
import './product_create.dart';
import './pdoruct_list.dart';

class ProductsAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
            child: Column(children: <Widget>[
          AppBar(automaticallyImplyLeading: false, title: Text('Choose')),
          ListTile(
            title: Text('Products'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ProductsPage()));
            },
          )
        ])),
        appBar: AppBar(
          title: Text('Products Admin'),
          bottom: TabBar(tabs: <Widget>[
            Tab(icon: Icon(Icons.create), text: 'Create product'),
            Tab(icon: Icon(Icons.create), text: 'Second tab'),
          ]),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductCreatePage(),
            ProductListPage(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProductsAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products Admin'),
      ),
      body: Center(
        child: Text('Manage your products'),
      ),
    );
  }
}
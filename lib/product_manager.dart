import 'package:flutter/material.dart';

import './products.dart';
import './product_control.dart';

class ProductManager extends StatefulWidget {
  final Map startingProduct;

  ProductManager({this.startingProduct}) {
    print('[Products Manager] Constructor');
  }
 
  @override
  State<StatefulWidget> createState() {
    print('[Products Manager] createState()');
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<Map<String, String>> _products = [];

  @override
    void initState() {
      super.initState();
      print('[Products Manager] initState');
      if (widget.startingProduct != null) {
        _products.add(widget.startingProduct);  
      }
    }

  @override
    void didUpdateWidget(ProductManager oldWidget) {
      print('[Products Manager] didUpdateWidget()');
      super.didUpdateWidget(oldWidget);
    }

  void _addProduct(Map<String, String> product) {
    setState(() {
      _products.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('[Products Manager] build()');
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: ProductControl(_addProduct),
        ),
        Expanded(child: Products(_products),)
      ],
    );
  }
}

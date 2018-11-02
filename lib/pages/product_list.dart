import 'package:flutter/material.dart';

import './product_edit.dart';
import '../models/product.dart';

class ProductListPage extends StatelessWidget {
  final Function updateProduct;
  final Function deleteProduct;
  final List<Product> products;

  ProductListPage(this.products, this.updateProduct, this.deleteProduct);

  Widget _buildEditButton(BuildContext context, int index) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) {
            return ProductEditPage(
              product: products[index],
              updateProduct: updateProduct,
              productIndex: index,
            );
          }),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: Key(products[index].title),
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.endToStart) {
              print('Swiped end to start');
              deleteProduct(index);
            } else if (direction == DismissDirection.startToEnd) {
              print('Swiped start to end');
            } else {
              print('Other Swiping');
            }
          },
          background: Container(color: Colors.red),
          child: Column(
            children: <Widget>[
              
              Divider(),
            ],
          ),
        );
      },
      itemCount: products.length,
    );
  }
}

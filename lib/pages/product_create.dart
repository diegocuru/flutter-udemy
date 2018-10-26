import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _titleValue = '';
  String _descriptionValue = '';
  double _priceValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Product title',
            ),
            onChanged: (String title) {
              setState(() {
                _titleValue = title;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Product description',
            ),
            maxLines: 4,
            onChanged: (String description) {
              setState(() {
                _descriptionValue = description;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Product price',
            ),
            keyboardType: TextInputType.number,
            onChanged: (String price) {
              setState(() {
                _priceValue = double.parse(price);
              });
            },
          ),
          SizedBox(height: 15.0,),
          RaisedButton(
            child: Text('Save'),
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            onPressed: () {
              Map<String, dynamic> product = {
                'title': _titleValue,
                'description': _descriptionValue,
                'price': _priceValue,
                'ímage': 'assets/food.jpg',
              };
              print(product.toString());
              widget.addProduct(product);
              Navigator.pushReplacementNamed(context, '/products');
            },
          )
        ],
      ),
    );
  }
}

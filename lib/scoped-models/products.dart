import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';

class ProductsModel extends Model {
  List<Product> _products = [];
  int _selectedProductIndex;

  List<Product> get products {
    return List.from(_products);
  }
  void addProduct(Product product) {
    _products.add(product);
  }

  void updateProduct(Product product) {
    _products[_selectedProductIndex] = product;
  }

  void deleteProduct() {
    _products.removeAt(_selectedProductIndex);
  }

  void selectProduct(int index) {
    _selectedProductIndex = index;
  }
}

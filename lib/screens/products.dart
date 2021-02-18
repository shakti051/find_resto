import 'package:flutter/material.dart';
import 'package:mobulous_test/models/product_search.dart';
import 'package:mobulous_test/services/product.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  ProductService api = ProductService();
  ProductSearch productSearch;
  bool prodInfo = false;

  _getProduct() async {
    return await api.getProducts().then((value) {
      productSearch = value;
      int productArray = productSearch.response.products.length;
      for (int i = 0; i < productArray; i++)
        print(">>>>>>>>>>>>>>" + productSearch.response.products[i].name);
    });
  }

  @override
  void initState() {
    super.initState();
    _getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text("these products are available"),
        ),
      ],
    );
  }
}

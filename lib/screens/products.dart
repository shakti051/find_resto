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
  int productArray;
  List<String> listOf = [];

  _getProduct() async {
    return await api.getProducts().then((value) {
      productSearch = value;
      productArray = productSearch.response.products.length;
      setState(() {
        prodInfo = true;
      });
      for (int i = 0; i < productArray; i++) {
//        print(">>>>>>>>>>>>>>" + productSearch.response.products[i].name);
        listOf.add(productSearch.response.products[i].name);
      }
      print("Total no of product " + productArray.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    _getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return prodInfo
        ? SingleChildScrollView(
            child: Column(
              children: [
                Row(children: [
                  Container(
                      margin: EdgeInsets.all(8),
                      child: Text(productArray.toString() + " Products!!",
                          style: TextStyle(fontSize: 20)))
                ]),
                Container(
                  margin: EdgeInsets.all(6),
                  padding: EdgeInsets.all(6),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (_, int index) =>
                        listDataItems(this.listOf[index]),
                    itemCount: this.listOf.length,
                  ),
                ),
              ],
            ),
          )
        : Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.cyan,
            ),
          );
  }
}

class listDataItems extends StatelessWidget {
  String itemName;
  listDataItems(this.itemName);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7.0,
      child: Container(
        margin: EdgeInsets.all(7),
        padding: EdgeInsets.all(6),
        child: Column(children: <Widget>[
          Image.asset("assets/images/honey_pic.png"),
          Padding(padding: EdgeInsets.all(8)),
          Row(children: [
            Text(
              itemName,
              style: TextStyle(fontSize: 20),
            )
          ])
        ]),
      ),
    );
  }
}

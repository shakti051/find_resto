import 'package:flutter/material.dart';
import 'package:mobulous_test/models/product_search.dart';
import 'package:mobulous_test/services/product.dart';

class Stores extends StatefulWidget {
  @override
  _StoresState createState() => _StoresState();
}

class _StoresState extends State<Stores> {
  ProductService api = ProductService();
  ProductSearch productSearch;
  bool storeInfo = false;
  int storeArray;
  List<String> listOf = [];

  _getStore() async {
    return await api.getProducts().then((value) {
      productSearch = value;
      storeArray = productSearch.response.stores.length;
      setState(() {
        storeInfo = true;
      });
      for (int i = 0; i < storeArray; i++) {
        print("The stores are: " + productSearch.response.stores[i].name);
        listOf.add(productSearch.response.stores[i].name);
      }
      print("Total no of stores " + storeArray.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    _getStore();
  }

  @override
  Widget build(BuildContext context) {
    return storeInfo
        ? SingleChildScrollView(
            child: Column(
              children: [
                Row(children: [
                  Container(
                      margin: EdgeInsets.all(8),
                      child: Text(storeArray.toString() + " Stores!!",
                          style: TextStyle(fontSize: 20)))
                ]),
                GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 8.0,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    children: List.generate(listOf.length, (index) {
                      return listStoreItems(this.listOf[index]);
                    })),
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

class listStoreItems extends StatelessWidget {
  String itemName;
  listStoreItems(this.itemName);
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
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Flexible(
                child: Text(
              itemName,
              style: TextStyle(fontSize: 15),
            )),
          ])
        ]),
      ),
    );
  }
}

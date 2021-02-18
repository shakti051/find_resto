import 'dart:convert';
import 'package:mobulous_test/models/product_search.dart';
import 'package:mobulous_test/post.dart';

class ProductService {
  Post _post = Post();
  Future<ProductSearch> getProducts() async {
    final apiUrl = "http://54.152.130.226/honey_app/api/search";
    Map data = {"action": "get_product"};
    return _post
        .post(apiUrl, body: json.encode(data))
        .then((dynamic res) async {
      return ProductSearch.fromJson(res);
    });
  }
}
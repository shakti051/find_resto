//http://54.152.130.226/honey_app/api/search

class ProductSearch {
  String status;
  Response response;
  String message;
  String requestKey;

  ProductSearch({this.status, this.response, this.message, this.requestKey});

  ProductSearch.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
    message = json['message'];
    requestKey = json['requestKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.response != null) {
      data['response'] = this.response.toJson();
    }
    data['message'] = this.message;
    data['requestKey'] = this.requestKey;
    return data;
  }
}

class Response {
  List<Products> products;
  List<Stores> stores;

  Response({this.products, this.stores});

  Response.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
    if (json['stores'] != null) {
      stores = new List<Stores>();
      json['stores'].forEach((v) {
        stores.add(new Stores.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    if (this.stores != null) {
      data['stores'] = this.stores.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int id;
  String sellerId;
  String name;
  String images;
  String mrp;
  int sp;
  String discount;
  String shipsIn;
  String favourite;
  String havecart;

  Products(
      {this.id,
      this.sellerId,
      this.name,
      this.images,
      this.mrp,
      this.sp,
      this.discount,
      this.shipsIn,
      this.favourite,
      this.havecart});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerId = json['seller_id'];
    name = json['name'];
    images = json['images'];
    mrp = json['mrp'];
    sp = json['sp'];
    discount = json['discount'];
    shipsIn = json['ships_in'];
    favourite = json['favourite'];
    havecart = json['havecart'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['seller_id'] = this.sellerId;
    data['name'] = this.name;
    data['images'] = this.images;
    data['mrp'] = this.mrp;
    data['sp'] = this.sp;
    data['discount'] = this.discount;
    data['ships_in'] = this.shipsIn;
    data['favourite'] = this.favourite;
    data['havecart'] = this.havecart;
    return data;
  }
}

class Stores {
  int id;
  String name;
  String email;
  String image;
  String coverImage;
  int deliveryTime;
  List<String> type;
  String shipping;
  int rating;
  int ratingCount;
  String favourite;

  Stores(
      {this.id,
      this.name,
      this.email,
      this.image,
      this.coverImage,
      this.deliveryTime,
      this.type,
      this.shipping,
      this.rating,
      this.ratingCount,
      this.favourite});

  Stores.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    coverImage = json['cover_image'];
    deliveryTime = json['delivery_time'];
    type = json['type'].cast<String>();
    shipping = json['shipping'];
    rating = json['rating'];
    ratingCount = json['rating_count'];
    favourite = json['favourite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['image'] = this.image;
    data['cover_image'] = this.coverImage;
    data['delivery_time'] = this.deliveryTime;
    data['type'] = this.type;
    data['shipping'] = this.shipping;
    data['rating'] = this.rating;
    data['rating_count'] = this.ratingCount;
    data['favourite'] = this.favourite;
    return data;
  }
}
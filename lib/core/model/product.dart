class Product {
  late String product;
  late int money;
  late String imageURL;
  late String key;

  Product({required this.product, required this.money, required this.imageURL});

  Product.fromJson(Map<String, dynamic> json) {
    product = json['product'];
    money = json['money'];
    imageURL = json['imageURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product'] = this.product;
    data['money'] = this.money;
    data['imageURL'] = this.imageURL;
    return data;
  }
}

class ProductList {
  List<Product> products = [];

  ProductList.fromJsonList(Map value) {
    value.forEach((key, value) {
      var product = Product.fromJson(value);
      product.key = key;
      products.add(product);
    });
  }
}

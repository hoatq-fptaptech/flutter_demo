import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Product {
  int? id;
  String? title;
  String? thumbnail;
  String? description;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  List<String>? images;

  Product(
      { this.id,
        this.title,
        this.description,
        this.price,
        this.discountPercentage,
        this.rating,
        this.stock,
        this.brand,
        this.category,
        this.thumbnail,
        this.images}
      );
  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = double.parse(json['price'].toString());
    discountPercentage = double.parse(json['discountPercentage'].toString());
    rating = double.parse(json['rating'].toString());
    stock = json['stock'];
    brand = json['brand'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['discountPercentage'] = discountPercentage;
    data['rating'] = rating;
    data['stock'] = stock;
    data['brand'] = brand;
    data['category'] = category;
    data['thumbnail'] = thumbnail;
    data['images'] = images;
    return data;
  }
}

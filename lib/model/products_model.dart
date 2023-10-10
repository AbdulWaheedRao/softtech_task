// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  Product({
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
  });

  Product copyWith({
    int? id,
    String? title,
    num? price,
    String? description,
    String? category,
    String? image,
  }) {
    return Product(
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      title: map['title'] != null ? map['title'] as String : null,
      price: map['price'] != null ? map['price'] as num : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(title: $title, price: $price, description: $description, category: $category, image: $image)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.price == price &&
        other.description == description &&
        other.category == category &&
        other.image == image;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        price.hashCode ^
        description.hashCode ^
        category.hashCode ^
        image.hashCode;
  }
}

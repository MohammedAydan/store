class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final double discount;
  final String imageUrl;
  final int stockQuantity;
  final String category;
  final String brand;
  final double rating;
  final List<String> reviews;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.imageUrl,
    required this.stockQuantity,
    required this.category,
    required this.brand,
    required this.rating,
    required this.reviews,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: double.parse(json['price'].toString()),
      discount: double.parse(json['discount'].toString()),
      imageUrl: json['imageUrl'],
      stockQuantity: int.parse(json['stockQuantity'].toString()),
      category: json['category'],
      brand: json['brand'],
      rating: double.parse(json['rating'].toString()),
      reviews: List<String>.from(json['reviews']),
    );
  }

  factory ProductModel.fromJsonForFakestoreapiDATA(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"].toString(),
      name: json["title"],
      description: json["description"],
      price: double.parse(json["price"].toString()),
      discount: 0,
      imageUrl: json["image"],
      stockQuantity: 6,
      category: json["category"],
      brand: "brand",
      rating: double.parse(json["rating"]["rate"].toString()),
      reviews: ["review1", "review2"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'discount': discount,
      'imageUrl': imageUrl,
      'stockQuantity': stockQuantity,
      'category': category,
      'brand': brand,
      'rating': rating,
      'reviews': reviews,
    };
  }
}

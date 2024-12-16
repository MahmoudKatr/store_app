class ProductModel {
  final int id;
  final String title;
  final String price;
  final String description;
  final String image;
  final String category;
  final ratingModel rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
    required this.rating,
  });

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'].toString(),
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      rating: jsonData['rating'] != null
          ? ratingModel.fromJson(jsonData['rating'])
          : ratingModel(rate: 0.0, count: 0.0), // Handle null rating
    );
  }
}

class ratingModel {
  final double rate;
  final double count;

  ratingModel({
    required this.rate,
    required this.count,
  });

  factory ratingModel.fromJson(jsonData) {
    return ratingModel(
      rate: (jsonData['rate'] ?? 0.0).toDouble(), // Default to 0.0 if null
      count: (jsonData['count'] ?? 0.0).toDouble(),
    );
  }
}

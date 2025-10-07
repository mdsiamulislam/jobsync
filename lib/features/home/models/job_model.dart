class JobModel {
  final int id;
  final String title;
  final String description;
  final String brand; // company name
  final String category;
  final double price; // salary
  final String thumbnail;

  JobModel({
    required this.id,
    required this.title,
    required this.description,
    required this.brand,
    required this.category,
    required this.price,
    required this.thumbnail,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: json['id'],
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      brand: json['brand'] ?? '',
      category: json['category'] ?? '',
      price: (json['price'] as num).toDouble(),
      thumbnail: json['thumbnail'] ?? '',
    );
  }
}

class Job {
  final int id;
  final String title;
  final String? brand;
  final String? category;
  final double price;
  final String? description;
  final String? thumbnail;

  Job({
    required this.id,
    required this.title,
    this.brand,
    this.category,
    required this.price,
    this.description,
    this.thumbnail,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    id: json['id'],
    title: json['title'],
    brand: json['brand'],
    category: json['category'],
    price: (json['price'] as num).toDouble(),
    description: json['description'],
    thumbnail: json['thumbnail'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'brand': brand,
    'category': category,
    'price': price,
    'description': description,
    'thumbnail': thumbnail,
  };
}

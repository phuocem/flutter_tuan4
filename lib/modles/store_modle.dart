class Course {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  final String instructor;
  final int durationMinutes;
  final List<String> tags;
  int soldQuantity;

  Course({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.instructor,
    required this.durationMinutes,
    required this.tags,
    this.soldQuantity = 0,
  });

  Course.defaultConstructor()
      : id = '',
        title = '',
        imageUrl = '',
        description = '',
        instructor = '',
        durationMinutes = 0,
        tags = [],
        soldQuantity = 0;

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'imageUrl': imageUrl,
    'description': description,
    'instructor': instructor,
    'durationMinutes': durationMinutes,
    'tags': tags,
    'soldQuantity': soldQuantity,
  };

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    id: json['id'],
    title: json['title'],
    imageUrl: json['imageUrl'] ?? '',
    description: json['description'],
    instructor: json['instructor'],
    durationMinutes: json['durationMinutes'],
    tags: List<String>.from(json['tags']),
    soldQuantity: json['soldQuantity'] ?? 0,
  );
}

class CourseInCart extends Course {
  int quantity;

  CourseInCart({
    this.quantity = 1,
    required super.id,
    required super.title,
required super.imageUrl,
required super.description,
    required super.instructor,
    required super.durationMinutes,
    required super.tags,
  });

  CourseInCart.defaultConstructor()
      : quantity = 1,
        super.defaultConstructor();

  @override
  Map<String, dynamic> toJson() => {
    ...super.toJson(),
    'quantity': quantity,
  };

  factory CourseInCart.fromJson(Map<String, dynamic> json) => CourseInCart(
    id: json['id'],
    title: json['title'],
    imageUrl: json['imageUrl'] ?? '',
    description: json['description'],
    instructor: json['instructor'],
    durationMinutes: json['durationMinutes'],
    tags: List<String>.from(json['tags']),
    quantity: json['quantity'],
  );
}

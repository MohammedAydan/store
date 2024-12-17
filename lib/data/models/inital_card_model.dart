class InitalCardModel {
  String id;
  String title;
  String description;
  String image;
  String route;
  String color;

  InitalCardModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.route,
    required this.color,
  });

  factory InitalCardModel.fromJson(Map<String, dynamic> json) {
    return InitalCardModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      route: json['route'],
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'route': route,
      'color': color,
    };
  }

  factory InitalCardModel.empty() {
    return InitalCardModel(
      id: "",
      title: "",
      description: "",
      image: "",
      route: "",
      color: "",
    );
  }
}

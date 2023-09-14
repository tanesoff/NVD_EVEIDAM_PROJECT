class DataModel{
  String name;
  String location;
  String img;
  String description;
  int stars;

  DataModel({
    required this.name,
    required this.location,
    required this.img,
    required this.description,
    required this.stars,
  });

  factory DataModel.fromJson(Map<String, dynamic> json){
    return DataModel(
      name: json['name'],
      location: json['location'],
      img: json['img'],
      description: json['description'],
      stars: json['stars']
    );
  }
}
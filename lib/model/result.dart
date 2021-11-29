class Result{
  late int id;
  late String name;
  late String status;
  late String species;
  late String type;
  late String gender;

  late Map<String, dynamic>origin;

  late String image;
  late String url;
  late String created;

  Result.json(Map<String, dynamic> map){
    id = map['id'];
    name = map['name'];
    status = map['status'];
    species = map['species'];
    type = map['type'];
    gender = map['gender'];
    origin = map['origin'];
    image = map['image'];
    url = map['url'];

  }
}
import 'package:rick_et_morty/model/result.dart';

class Character{

  late Map<String, dynamic> info;
  List<Result>results = [];

  Character.json(Map<String, dynamic> map){
    Result ?results;
    results!.id = map["id"];
    results.name = map["name"];
    results.status = map["status"];
    results.species = map["species"];
    results.type = map["type"];
    results.gender = map["gender"];

  }

}
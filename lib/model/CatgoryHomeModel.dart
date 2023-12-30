class CategoryModel {
  int? id;
  String? typeOfGame;
  String? picture;

  CategoryModel({this.id, this.typeOfGame, this.picture});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeOfGame = json['type_of_game'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type_of_game'] = this.typeOfGame;
    data['picture'] = this.picture;
    return data;
  }
}
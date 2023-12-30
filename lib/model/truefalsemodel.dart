class Classtruemodel {
  int? id;
  int? points;

  Classtruemodel({this.id, this.points});

  Classtruemodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    points = json['points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['points'] = this.points;
    return data;
  }
}

class Quetsionmodel {
  int? id;
  String? question;
  String? solution;

  Quetsionmodel({this.id, this.question, this.solution});

  Quetsionmodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    solution = json['solution'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['solution'] = this.solution;
    return data;
  }
}

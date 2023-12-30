class ModelMultyChoise {
  int? id;
  String? question;
  String? solution;
  String? translation;
  String? questionImage;
  String? questionAudio;
  String? choice1;
  String? choice2;
  String? choice3;
  String? choice4;

  ModelMultyChoise(
      {this.id,
      this.question,
      this.solution,
      this.translation,
      this.questionImage,
      this.questionAudio,
      this.choice1,
      this.choice2,
      this.choice3,
      this.choice4});

  ModelMultyChoise.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    solution = json['solution'];
    translation = json['translation'];
    questionImage = json['question_image'];
    questionAudio = json['question_audio'];
    choice1 = json['choice1'];
    choice2 = json['choice2'];
    choice3 = json['choice3'];
    choice4 = json['choice4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['solution'] = this.solution;
    data['translation'] = this.translation;
    data['question_image'] = this.questionImage;
    data['question_audio'] = this.questionAudio;
    data['choice1'] = this.choice1;
    data['choice2'] = this.choice2;
    data['choice3'] = this.choice3;
    data['choice4'] = this.choice4;
    return data;
  }
}

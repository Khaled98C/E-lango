class ModelTrueOrFalse {
  int? id;
  String? question;
  String? solution;
  String? translation;
  String? questionImage;
  String? questionAudio;

  ModelTrueOrFalse(
      {this.id,
      this.question,
      this.solution,
      this.translation,
      this.questionImage,
      this.questionAudio});

  ModelTrueOrFalse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    solution = json['solution'];
    translation = json['translation'];
    questionImage = json['question_image'];
    questionAudio = json['question_audio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['solution'] = this.solution;
    data['translation'] = this.translation;
    data['question_image'] = this.questionImage;
    data['question_audio'] = this.questionAudio;
    return data;
  }
}
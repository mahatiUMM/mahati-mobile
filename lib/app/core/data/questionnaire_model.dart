class QuestionnaireResult {
  final bool status;
  // final int totalResults;
  final List<Questionnaire> questionnaires;

  QuestionnaireResult({
    required this.status,
    // required this.totalResults,
    required this.questionnaires,
  });

  factory QuestionnaireResult.fromJson(Map<String, dynamic> json) =>
      QuestionnaireResult(
        status: json["success"],
        // totalResults: json["totalResults"],
        questionnaires: List<Questionnaire>.from((json["data"] as List)
            .map((x) => Questionnaire.fromJson(x))
            .where((questionnaire) => questionnaire.type != null)),
      );
}

class Questionnaire {
  int? type;
  String? title;
  String? description;
  String? image;
  List<QuestionnaireQuestion> question;
  Questionnaire({
    required this.type,
    required this.title,
    required this.description,
    required this.image,
    required this.question,
  });

  factory Questionnaire.fromJson(Map<String, dynamic> json) => Questionnaire(
        type: json["type"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        question: List<QuestionnaireQuestion>.from(
            (json["questionnaire_questions"] as List)
                .map((x) => QuestionnaireQuestion.fromJson(x))
                .where((question) => question.questionnaireid != null)),
      );
}

class QuestionnaireQuestion {
  int? questionnaireid;
  String? question;

  QuestionnaireQuestion(
      {required this.questionnaireid, required this.question});

  factory QuestionnaireQuestion.fromJson(Map<String, dynamic> json) =>
      QuestionnaireQuestion(
        questionnaireid: json["questionnaire_id"],
        question: json['question'],
      );
}

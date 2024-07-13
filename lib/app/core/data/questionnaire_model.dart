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
  int? id;
  int? type;
  String? title;
  String? description;
  String? image;
  List<QuestionnaireQuestion> question;
  Questionnaire({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.image,
    required this.question,
  });

  factory Questionnaire.fromJson(Map<String, dynamic> json) => Questionnaire(
        id: json["id"],
        type: json["type"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        question: List<QuestionnaireQuestion>.from(
            (json["questionnaire_questions"] as List)
                .map((x) => QuestionnaireQuestion.fromJson(x))),
      );
}

class AvailableAnswer {
  int? id;
  int? questionnaireQuestionId;
  String? answerText;

  AvailableAnswer({
    required this.id,
    required this.questionnaireQuestionId,
    required this.answerText,
  });

  factory AvailableAnswer.fromJson(Map<String, dynamic> json) =>
      AvailableAnswer(
        id: json["id"],
        questionnaireQuestionId: json["questionnaireQuestionId"],
        answerText: json["answer_text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "questionnaireQuestionId": questionnaireQuestionId,
        "answer_text": answerText,
      };
}

class QuestionnaireQuestion {
  int? questionnaireid;
  String? question;
  final List<AvailableAnswer> availableAnswers;

  QuestionnaireQuestion({
    required this.questionnaireid,
    required this.question,
    required this.availableAnswers,
  });

  factory QuestionnaireQuestion.fromJson(Map<String, dynamic> json) =>
      QuestionnaireQuestion(
        questionnaireid: json["questionnaire_id"],
        question: json['question'],
        availableAnswers: json["available_answers"] != null
            ? List<AvailableAnswer>.from((json["available_answers"] as List)
                .map((x) => AvailableAnswer.fromJson(x)))
            : [],
      );
}

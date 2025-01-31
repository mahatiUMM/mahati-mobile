// To parse this JSON data, do
//
//     final questionnaireUserAnswer = questionnaireUserAnswerFromJson(jsonString);

import 'dart:convert';

QuestionnaireUserAnswer questionnaireUserAnswerFromJson(String str) => QuestionnaireUserAnswer.fromJson(json.decode(str));

String questionnaireUserAnswerToJson(QuestionnaireUserAnswer data) => json.encode(data.toJson());

class QuestionnaireUserAnswer {
    bool success;
    List<DataQuestionnaireUser> data;

    QuestionnaireUserAnswer({
        required this.success,
        required this.data,
    });

    factory QuestionnaireUserAnswer.fromJson(Map<String, dynamic> json) => QuestionnaireUserAnswer(
        success: json["success"],
        data: List<DataQuestionnaireUser>.from(json["data"].map((x) => DataQuestionnaireUser.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class DataQuestionnaireUser {
    int id;
    int questionId;
    int answer;
    int userId;
    DateTime createdAt;
    dynamic updatedAt;
    Question question;
    String selectedAnswer;
    int selectedAnswerId;

    DataQuestionnaireUser({
        required this.id,
        required this.questionId,
        required this.answer,
        required this.userId,
        required this.createdAt,
        required this.updatedAt,
        required this.question,
        required this.selectedAnswer,
        required this.selectedAnswerId,
    });

    factory DataQuestionnaireUser.fromJson(Map<String, dynamic> json) => DataQuestionnaireUser(
        id: json["id"],
        questionId: json["question_id"],
        answer: json["answer"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        question: Question.fromJson(json["question"]),
        selectedAnswer: json["selected_answer"],
        selectedAnswerId: json["selected_answer_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "question_id": questionId,
        "answer": answer,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
        "question": question.toJson(),
        "selected_answer": selectedAnswer,
        "selected_answer_id": selectedAnswerId,
    };
}

class Question {
    int id;
    int questionnaireId;
    String question;
    DateTime createdAt;
    dynamic updatedAt;
    QuestionnaireUser questionnaire;
    List<UserAvailableAnswer> availableAnswers;

    Question({
        required this.id,
        required this.questionnaireId,
        required this.question,
        required this.createdAt,
        required this.updatedAt,
        required this.questionnaire,
        required this.availableAnswers,
    });

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        questionnaireId: json["questionnaire_id"],
        question: json["question"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        questionnaire: QuestionnaireUser.fromJson(json["questionnaire"]),
        availableAnswers: List<UserAvailableAnswer>.from(json["available_answers"].map((x) => UserAvailableAnswer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "questionnaire_id": questionnaireId,
        "question": question,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
        "questionnaire": questionnaire.toJson(),
        "available_answers": List<dynamic>.from(availableAnswers.map((x) => x.toJson())),
    };
}

class UserAvailableAnswer {
    int id;
    String answerText;

    UserAvailableAnswer({
        required this.id,
        required this.answerText,
    });

    factory UserAvailableAnswer.fromJson(Map<String, dynamic> json) => UserAvailableAnswer(
        id: json["id"],
        answerText: json["answer_text"],
    );

    Map<String, dynamic> toJson() => {
        "id":id,
        "answer_text": answerText,
    };
}

class QuestionnaireUser {
    int id;
    String title;
    String image;
    String description;

    QuestionnaireUser({
        required this.id,
        required this.title,
        required this.image,
        required this.description,
    });

    factory QuestionnaireUser.fromJson(Map<String, dynamic> json) => QuestionnaireUser(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id":id,
        "title": title,
        "image": image,
        "description": description,
    };
}

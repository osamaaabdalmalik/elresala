import 'package:elresala/features/muslim/domain/entities/muslim_entity.dart';

class MuslimModel extends Muslim {
  MuslimModel({
    required super.title,
    required super.description,
    required super.lessons,
  });

  factory MuslimModel.fromJson(Map<String, dynamic> json) => MuslimModel(
        title: json["title"],
        description: json["description"],
        lessons: List<LessonModel>.from(
            json["lessons"].map((x) => LessonModel.fromJson(x))),
      );
}

class LessonModel extends Lesson {
  LessonModel({
    required super.header,
    required super.nestedTopics,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) => LessonModel(
        header: json["header"],
        nestedTopics: List<NestedTopicModel>.from(
            json["nestedTopics"].map((x) => NestedTopicModel.fromJson(x))),
      );
}

class NestedTopicModel extends NestedTopic {
  NestedTopicModel({
    required super.title,
    required super.body,
  });

  factory NestedTopicModel.fromJson(Map<String, dynamic> json) =>
      NestedTopicModel(
        title: json["title"],
        body: json["body"],
      );
}

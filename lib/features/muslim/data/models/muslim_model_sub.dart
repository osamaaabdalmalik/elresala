
import '../../domain/entities/muslim_entity.dart';

class LessonModel extends Lesson {
  LessonModel({
    required super.header,
    required super.nestedTopics,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) => LessonModel(
    header: json["header"] ?? '',
    nestedTopics: json["nestedTopicModels"] != null
        ? List<NestedTopicModel>.from(
      json["nestedTopicModels"].map(
            (x) => NestedTopicModel.fromJson(x),
      ),
    )
        : [],
  );
}

class NestedTopicModel extends NestedTopic {
  NestedTopicModel({
    required super.title,
    required super.body,
 required super.vedio,
  });

  factory NestedTopicModel.fromJson(Map<String, dynamic> json) => NestedTopicModel(
    title: json["title"],
    body: json["body"],
    vedio: json.containsKey('video')?json["vedio"]:null,
  );
}

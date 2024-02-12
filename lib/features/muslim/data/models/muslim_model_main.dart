import 'package:elresala/features/muslim/domain/entities/muslim_entity.dart';

import 'muslim_model_sub.dart';

//Model for NewMuslimCourse , NewMuslimQuran json

class MuslimModel extends Muslim {
  MuslimModel({
    required super.title,
    required super.description,
    required super.lessons,
  });

  factory MuslimModel.fromJson(Map<String, dynamic> json) => MuslimModel(
        title: json["title"] ?? '',
        description: json.containsKey("description")?json["description"] :null,
        lessons: List<LessonModel>.from(
          json["lessons"] != null
              ? json["lessons"].map(
                  (x) => LessonModel.fromJson(x),
                )
              : [],
        ),
      );
}

    //Model for NewMuslimLife , Moomalt ,Ayman, Serah, json

class MuslimCoursesModel extends Muslim{
  MuslimCoursesModel({
    required super.title,
    required super.description,
    required super.lessons,
  });
  factory MuslimCoursesModel.fromJson(Map<String,dynamic> json)=>
      MuslimCoursesModel(
        title: json["title"] ?? '',
        description:json.containsKey("description")?json["description"] :null,
        lessons: List<NestedTopicModel>.from(
          json["lessons"] != null
              ? json["lessons"].map(
                (x) => NestedTopicModel.fromJson(x),
          )
              : [],
        ),
      );
}

//Model Arkan json


 /*class ArkanCoursesModel extends Muslim{
  ArkanCoursesModel({
    required super.title,
    required super.description,
    required super.lessons,
  });
  factory ArkanCoursesModel.fromJson(Map<String,dynamic> json)=>
      ArkanCoursesModel(
        title: json["title"] ?? '',
        description: json["description"] ?? '',
        lessons: List<NestedTopicModel>.from(
          json["lessons"] != null
              ? json["lessons"].map(
                (x) => NestedTopicModel.fromJson(x),
          )
              : [],
        ),
      );
}
*/

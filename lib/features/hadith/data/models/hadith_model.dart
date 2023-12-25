import 'package:elresala/features/hadith/domain/entities/hadith_entity.dart';

class HadithModel extends Hadith {
  const HadithModel({
    required super.name,
    required super.arabicContent,
    required super.content,
    required super.teller,
  });

  factory HadithModel.fromJson(Map<String, dynamic> json) {
    return HadithModel(
      name: json['name'],
      arabicContent: json['arabic_content'],
      content: json['content'],
      teller: json['teller'],
    );
  }
}

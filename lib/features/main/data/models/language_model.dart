import 'package:elresala/features/main/domain/entities/language_entity.dart';

class LanguageModel extends Language {
  const LanguageModel({
    required super.name,
    required super.isDownloaded,
  });

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(
      name: json['name'],
      isDownloaded: json['is_downloaded'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'is_downloaded': isDownloaded,
    };
  }
}

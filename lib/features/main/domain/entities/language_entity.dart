import 'package:elresala/features/main/data/models/language_model.dart';

class Language {
  final String name;
  final bool isDownloaded;

  const Language({
    required this.name,
    required this.isDownloaded,
  });

  LanguageModel toModel() {
    return LanguageModel(
      name: name,
      isDownloaded: isDownloaded,
    );
  }
}

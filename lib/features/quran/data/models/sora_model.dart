import 'package:elresala/features/quran/data/models/ayah_model.dart';
import 'package:elresala/features/quran/domain/entities/ayah_entity.dart';
import 'package:elresala/features/quran/domain/entities/sora_entity.dart';

class SoraModel extends Sora {
  const SoraModel({
    required super.name,
    required super.ayat,
  });

  factory SoraModel.fromJson(Map<String, dynamic> json) {
    return SoraModel(
      name: json['sora'],
      ayat: (json['ayat'] as List)
          .map<Ayah>(
            (ayah) => AyahModel.fromJson(ayah),
          )
          .toList(),
    );
  }
}

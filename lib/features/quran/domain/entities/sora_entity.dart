import 'package:elresala/features/quran/domain/entities/ayah_entity.dart';

class Sora {
  final String name;
  final List<Ayah> ayat;

  const Sora({
    required this.name,
    required this.ayat,
  });
}

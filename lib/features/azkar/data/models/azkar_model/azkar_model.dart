import 'zikr.dart';

class AzkarModel {
  final int? categoryID;
  final String? categoryNameAr;
  final String? categoryNameEs;
  final List<ZikrModel>? zikr;

  AzkarModel({
    this.categoryID,
    this.categoryNameAr,
    this.categoryNameEs,
    this.zikr,
  });
  factory AzkarModel.fromJson(Map<String, dynamic> json) {
    return AzkarModel(
      categoryID: json['CategoryID'],
      categoryNameAr: json['CategoryName_Ar'],
      categoryNameEs: json['CategoryName_Es'],
      zikr: json['Zikr'] == null
          ? null
          : List<ZikrModel>.from(
              json['Zikr'].map((x) => ZikrModel.fromJson(x))),
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CategoryID'] = categoryID;
    data['CategoryName_Ar'] = categoryNameAr;
    data['CategoryName_Es'] = categoryNameEs;
    if (zikr != null) {
      data['Zikr'] = zikr!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

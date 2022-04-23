import 'package:test_app/domain/entities/origin_entity.dart';

class OriginModel extends OriginEntity {
  const OriginModel({required String name, required String url})
      : super(name: name, url: url);

  factory OriginModel.fromJson (Map<String,dynamic> json){
    return OriginModel(
        name: json['name'],
        url: json['url']);
  }
}

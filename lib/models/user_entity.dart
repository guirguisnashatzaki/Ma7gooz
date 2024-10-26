import 'package:json_annotation/json_annotation.dart';
part 'user_entity.g.dart';

@JsonSerializable()
class User {
  int? id;
  String? name;
  String? password;
  bool? isAdmin;

  User ({required this.id,required this.name,required this.password,required this.isAdmin});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
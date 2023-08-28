import 'package:listview_with_flutter/models/address.dart';
import 'package:listview_with_flutter/models/company.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.username,
      required this.phoneNumber,
      required this.website,
      required this.address,
      required this.company});

  int id;
  String name;
  String email;
  String username;
  @JsonKey(name: 'phone')
  String phoneNumber;
  Address address;
  Company company;

  String website;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

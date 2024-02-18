import 'package:untitled/core/databases/api/end_points.dart';
import 'package:untitled/future/user_future/data/models/sub_models/address_model.dart';
import 'package:untitled/future/user_future/data/models/sub_models/company_model.dart';
import 'package:untitled/future/user_future/domain/entites/user_entitey.dart';

class UserModel extends UserEntity {
  final int id;
  final String username; //باقي البيانات ممكن مش هنحتاجها
  final String website;
  final CompanyModel company;
  UserModel({
    required this.id,
    required super.name, //بسسبب UserEntity
    required super.phone,
    required super.email,
    required super.address,
    required this.username,
    required this.website,
    required this.company,
  });

//api لكي نجيب البيانات
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json[ApiKey.id],
      name: json[ApiKey.name],
      phone: json[ApiKey.phone],
      email: json[ApiKey.email],
      username: json[ApiKey.username],
      website: json[ApiKey.website],
      address: AddressModel.fromJson(json[ApiKey.address]),
      company: CompanyModel.fromJson(json[ApiKey.company]),
    );
  }

  Map<String, dynamic> toJson() {
    //casheلكي البيانات في
    return {
      ApiKey.id: id,
      ApiKey.name: name,
      ApiKey.email: email,
      ApiKey.phone: phone,
      ApiKey.username: username,
      ApiKey.website: website,
      ApiKey.company: company,
      ApiKey.address: address,
    };
  }
}

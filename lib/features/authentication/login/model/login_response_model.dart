import 'package:dio_nexus/dio_nexus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/product/manager/database/enum/hive_types.dart';
import 'package:flutter_architecture_template/product/manager/database/hive_model_mixin.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_response_model.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveTypes.loginResponseId)
@immutable
final class LoginResponseModel extends IDioNexusNetworkModel<LoginResponseModel>
    with HiveModelMixin {
  LoginResponseModel({
    this.token,
  });

  // For Hive Key
  static const String _modelKey = 'LoginResponseModel';

  @override
  String get key => _modelKey;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseModelFromJson(json);
  }

  @HiveField(0)
  final String? token;

  LoginResponseModel copyWith({
    String? token,
  }) {
    return LoginResponseModel(
      token: token ?? this.token,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$LoginResponseModelToJson(this);
  }

  @override
  String toString() => 'LoginResponseModel(token: $token)';

  @override
  LoginResponseModel fromJson(Map<String, dynamic> json) =>
      LoginResponseModel.fromJson(json);
}

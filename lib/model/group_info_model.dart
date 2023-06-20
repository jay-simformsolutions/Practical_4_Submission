import 'package:json_annotation/json_annotation.dart';

part 'group_info_model.g.dart';

@JsonSerializable()
class GroupInfoModel {
  GroupInfoModel({
    this.id,
    required this.name,
    required this.groupImage,
    required this.createdAt,
  });

  factory GroupInfoModel.fromJson(Map<String, dynamic> json) {
    return _$GroupInfoModelFromJson(json);
  }

  final String? id;
  final String? name;
  @JsonKey(name: 'cover_photo')
  final String? groupImage;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  Map<String, dynamic> toJson() => _$GroupInfoModelToJson(this);
}

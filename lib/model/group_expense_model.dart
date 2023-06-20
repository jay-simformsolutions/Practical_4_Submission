import 'package:json_annotation/json_annotation.dart';

part 'group_expense_model.g.dart';

@JsonSerializable()
class GroupExpenseModel {
  GroupExpenseModel({
    required this.date,
    required this.description,
    required this.category,
    this.userData = 0.0,
    required this.cost,
  });

  factory GroupExpenseModel.fromJson(Map<String, dynamic> json) {
    return _$GroupExpenseModelFromJson(json);
  }

  final String? date;
  final String? description;
  final String? category;
  @JsonKey(name: 'SahilTotala')
  final double userData;
  final double? cost;

  Map<String, dynamic> toJson() => _$GroupExpenseModelToJson(this);
}

import 'package:equatable/equatable.dart';

class AuditableEntity extends Equatable {
  final String createdBy;
  final String modifiedBy;
  final String createdDate;
  final String updatedDate;

  const AuditableEntity({
    this.createdBy = "",
    this.modifiedBy = "",
    required this.createdDate,
    required this.updatedDate,
  });

  @override
  List<Object?> get props => [createdBy, modifiedBy, createdDate, updatedDate];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'createdBy': createdBy,
      'modifiedBy': modifiedBy,
      'createdDate': createdDate,
      'updatedDate': updatedDate,
    };
  }

  factory AuditableEntity.fromJson(Map<String, dynamic> json) {
    return AuditableEntity(
      createdBy: json['createdBy'] as String,
      modifiedBy: json['modifiedBy'] as String,
      createdDate: json['createdDate'] as String,
      updatedDate: json['updatedDate'] as String,
    );
  }
}

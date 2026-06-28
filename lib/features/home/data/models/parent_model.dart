import '../../domain/entities/parent.dart';
import 'student_fee_model.dart';

class ParentModel extends Parent {
  const ParentModel({
    required super.id,
    required super.name,
    required List<StudentFeeModel> super.children,
  });

  factory ParentModel.fromJson(Map<String, dynamic> json) {
    return ParentModel(
      id: json['id'] as String,
      name: json['name'] as String,
      children: (json['children'] as List<dynamic>)
          .map((e) => StudentFeeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'children': children.map((e) => (e as StudentFeeModel).toJson()).toList(),
    };
  }
}

import 'student_fee.dart';

class Parent {
  final String id;
  final String name;
  final List<StudentFee> children;

  const Parent({required this.id, required this.name, required this.children});

  Parent copyWith({String? id, String? name, List<StudentFee>? children}) {
    return Parent(
      id: id ?? this.id,
      name: name ?? this.name,
      children: children ?? this.children,
    );
  }
}

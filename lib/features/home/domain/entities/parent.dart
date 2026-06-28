import 'student_fee.dart';

class Parent {
  final String id;
  final String name;
  final List<StudentFee> children;

  const Parent({
    required this.id,
    required this.name,
    required this.children,
  });
}

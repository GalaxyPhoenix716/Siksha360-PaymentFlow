import '../../domain/entities/student_fee.dart';

class StudentFeeModel extends StudentFee {
  const StudentFeeModel({
    required super.id,
    required super.studentName,
    required super.classGrade,
    required super.service,
    required super.fee,
  });

  factory StudentFeeModel.fromJson(Map<String, dynamic> json) {
    return StudentFeeModel(
      id: json['id'] as String,
      studentName: json['studentName'] as String,
      classGrade: json['classGrade'] as String,
      service: json['service'] as String,
      fee: (json['fee'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'studentName': studentName,
      'classGrade': classGrade,
      'service': service,
      'fee': fee,
    };
  }
}

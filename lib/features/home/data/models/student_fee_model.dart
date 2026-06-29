import '../../domain/entities/student_fee.dart';

class StudentFeeModel extends StudentFee {
  const StudentFeeModel({
    required super.id,
    required super.studentName,
    required super.grade,
    required super.serviceName,
    required super.serviceType,
    required super.fee,
  });

  factory StudentFeeModel.fromJson(Map<String, dynamic> json) {
    return StudentFeeModel(
      id: json['id'] as String,
      studentName: json['studentName'] as String,
      grade: json['grade'] as String,
      serviceName: json['serviceName'] as String,
      serviceType: json['serviceType'] as String,
      fee: (json['fee'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'studentName': studentName,
      'grade': grade,
      'serviceName': serviceName,
      'serviceType': serviceType,
      'fee': fee,
    };
  }
}

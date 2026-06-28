import '../../domain/entities/payment_method.dart';
import '../../domain/entities/payment_transaction.dart';

class PaymentTransactionModel extends PaymentTransaction {
  const PaymentTransactionModel({
    required super.transactionId,
    required super.receiverName,
    required super.receiverType,
    required super.amount,
    super.paymentMethod,
    required super.timestamp,
  });

  factory PaymentTransactionModel.fromJson(Map<String, dynamic> json) {
    return PaymentTransactionModel(
      transactionId: json['transactionId'] as String,
      receiverName: json['receiverName'] as String,
      receiverType: json['receiverType'] as String,
      amount: (json['amount'] as num).toDouble(),
      paymentMethod: json['paymentMethod'] != null
          ? PaymentMethod.values.firstWhere(
              (e) => e.name == json['paymentMethod'],
            )
          : null,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'transactionId': transactionId,
      'receiverName': receiverName,
      'receiverType': receiverType,
      'amount': amount,
      'paymentMethod': paymentMethod?.name,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

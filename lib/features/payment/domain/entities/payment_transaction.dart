import 'payment_method.dart';

class PaymentTransaction {
  final String transactionId;
  final String receiverName;
  final String receiverType;
  final double amount;
  final PaymentMethod paymentMethod;
  final DateTime timestamp;

  const PaymentTransaction({
    required this.transactionId,
    required this.receiverName,
    required this.receiverType,
    required this.amount,
    required this.paymentMethod,
    required this.timestamp,
  });
}

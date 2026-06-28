import 'package:siksha360_task/features/payment/domain/entities/payment_method.dart';
import 'package:siksha360_task/features/payment/domain/entities/payment_transaction.dart';

abstract class PaymentRepository {
  Future<PaymentTransaction> processPayment({
    required String receiverName,
    required String receiverType,
    required double amount,
    required PaymentMethod paymentMethod,
  });
}

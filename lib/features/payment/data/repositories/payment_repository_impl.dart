import 'dart:math';
import 'package:siksha360_task/features/payment/data/models/payment_transaction_model.dart';
import 'package:siksha360_task/features/payment/domain/entities/payment_method.dart';
import 'package:siksha360_task/features/payment/domain/entities/payment_transaction.dart';
import 'package:siksha360_task/features/payment/domain/repositories/payment_repository.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  @override
  Future<PaymentTransaction> processPayment({
    required String receiverName,
    required String receiverType,
    required double amount,
    required PaymentMethod paymentMethod,
  }) async {
    await Future.delayed(const Duration(seconds: 5));

    try {
      final randomNum = Random().nextInt(900000) + 100000;
      final String transactionID = 'TXN$randomNum';

      return PaymentTransactionModel(
        transactionId: transactionID,
        receiverName: receiverName,
        receiverType: receiverType,
        amount: amount,
        paymentMethod: paymentMethod,
        timestamp: DateTime.now(),
      );
    } catch (e) {
      throw Exception('Payment processing failed: $e');
    }
  }
}

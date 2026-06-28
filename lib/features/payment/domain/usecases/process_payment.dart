import 'package:siksha360_task/core/error/failures.dart';
import 'package:siksha360_task/features/payment/domain/entities/payment_transaction.dart';
import 'package:siksha360_task/features/payment/domain/repositories/payment_repository.dart';

class ProcessPaymentUseCase {
  final PaymentRepository repository;

  ProcessPaymentUseCase(this.repository);

  Future<PaymentTransaction> execute() async {
    try {
      return await repository.processPayment();
    } catch (e) {
      throw const PaymentFailure();
    }
  }
}

import 'package:siksha360_task/features/payment/domain/entities/payment_transaction.dart';

abstract class PaymentRepository {
  Future<PaymentTransaction> processPayment();
}

import 'package:siksha360_task/features/payment/domain/entities/payment_transaction.dart';

abstract class InvoiceRepository {
  Future<String> generateInvoice(PaymentTransaction transaction);
}

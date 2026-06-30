import 'package:siksha360_task/features/payment/domain/entities/payment_transaction.dart';
import 'package:siksha360_task/features/payment/domain/repositories/invoice_repository.dart';

class GenerateInvoiceUseCase {
  final InvoiceRepository repository;

  GenerateInvoiceUseCase(this.repository);

  Future<String> execute(PaymentTransaction transaction) async {
    return await repository.generateInvoice(transaction);
  }
}

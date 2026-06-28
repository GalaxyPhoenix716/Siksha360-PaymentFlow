import 'package:siksha360_task/features/payment/domain/entities/payment_method.dart';
import 'package:siksha360_task/features/payment/domain/entities/payment_transaction.dart';

class PaymentState {
  final PaymentMethod? selectedMethod;
  final String? validationError;
  final bool isLoading;
  final PaymentTransaction? transaction;
  final String? errorMessage;

  const PaymentState({
    this.selectedMethod,
    this.validationError,
    this.isLoading = false,
    this.transaction,
    this.errorMessage,
  });

  PaymentState copyWith({
    PaymentMethod? Function()? selectedMethod,
    String? Function()? validationError,
    bool? isLoading,
    PaymentTransaction? Function()? transaction,
    String? Function()? errorMessage,
  }) {
    return PaymentState(
      selectedMethod: selectedMethod != null
          ? selectedMethod()
          : this.selectedMethod,
      validationError: validationError != null
          ? validationError()
          : this.validationError,
      isLoading: isLoading ?? this.isLoading,
      transaction: transaction != null ? transaction() : this.transaction,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
    );
  }
}

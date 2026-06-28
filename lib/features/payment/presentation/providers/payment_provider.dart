import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:siksha360_task/features/payment/data/repositories/payment_repository_impl.dart';
import 'package:siksha360_task/features/payment/domain/entities/payment_method.dart';
import 'package:siksha360_task/features/payment/domain/repositories/payment_repository.dart';
import 'package:siksha360_task/features/payment/domain/usecases/process_payment.dart';
import 'package:siksha360_task/features/payment/presentation/providers/payment_state.dart';

part 'payment_provider.g.dart';

@riverpod
PaymentRepository paymentRepository(PaymentRepositoryRef ref) {
  return PaymentRepositoryImpl();
}

@riverpod
ProcessPaymentUseCase processPaymentUseCase(ProcessPaymentUseCaseRef ref) {
  final repository = ref.watch(paymentRepositoryProvider);
  return ProcessPaymentUseCase(repository);
}

@riverpod
class PaymentController extends _$PaymentController {
  @override
  PaymentState build() {
    return const PaymentState();
  }

  void selectPaymentMethod(PaymentMethod paymentMethod) {
    state = state.copyWith(
      selectedMethod: () => paymentMethod,
      validationError: () => null,
    );
  }

  Future<bool> processPayment({
    required String receiverName,
    required String receiverType,
    required double amount,
  }) async {
    if (state.selectedMethod == null) {
      state = state.copyWith(
        validationError: () => 'Please select a payment mode',
      );

      return false;
    }

    state = state.copyWith(isLoading: true, errorMessage: () => null);

    try {
      final paymentProvider = ref.read(processPaymentUseCaseProvider);

      final txn = await paymentProvider.execute(
        receiverName: receiverName,
        receiverType: receiverType,
        amount: amount,
        paymentMethod: state.selectedMethod!,
      );

      state = state.copyWith(isLoading: false, transaction: () => txn);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: () => e.toString(),
      );
      return false;
    }
  }

  void reset() {
    state = const PaymentState();
  }
}

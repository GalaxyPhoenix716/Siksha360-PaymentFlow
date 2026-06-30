// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paymentRepositoryHash() => r'a0cbd24813fc34bf731209f20d8c8e27c177a982';

/// See also [paymentRepository].
@ProviderFor(paymentRepository)
final paymentRepositoryProvider =
    AutoDisposeProvider<PaymentRepository>.internal(
      paymentRepository,
      name: r'paymentRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$paymentRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PaymentRepositoryRef = AutoDisposeProviderRef<PaymentRepository>;
String _$processPaymentUseCaseHash() =>
    r'4d2cbb218c181e93ed1577d4ce1cbf647ae120d1';

/// See also [processPaymentUseCase].
@ProviderFor(processPaymentUseCase)
final processPaymentUseCaseProvider =
    AutoDisposeProvider<ProcessPaymentUseCase>.internal(
      processPaymentUseCase,
      name: r'processPaymentUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$processPaymentUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProcessPaymentUseCaseRef =
    AutoDisposeProviderRef<ProcessPaymentUseCase>;
String _$invoiceRepositoryHash() => r'40843a3bc6c8128fe7ff9fc2d282090d7dd65a8a';

/// See also [invoiceRepository].
@ProviderFor(invoiceRepository)
final invoiceRepositoryProvider =
    AutoDisposeProvider<InvoiceRepository>.internal(
      invoiceRepository,
      name: r'invoiceRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$invoiceRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef InvoiceRepositoryRef = AutoDisposeProviderRef<InvoiceRepository>;
String _$generateInvoiceUseCaseHash() =>
    r'96e95602879a1851b4a93243d08edebcd7c0ab18';

/// See also [generateInvoiceUseCase].
@ProviderFor(generateInvoiceUseCase)
final generateInvoiceUseCaseProvider =
    AutoDisposeProvider<GenerateInvoiceUseCase>.internal(
      generateInvoiceUseCase,
      name: r'generateInvoiceUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$generateInvoiceUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GenerateInvoiceUseCaseRef =
    AutoDisposeProviderRef<GenerateInvoiceUseCase>;
String _$paymentControllerHash() => r'b14ed8894d933dc460ebdbdcf2adb25213e36e75';

/// See also [PaymentController].
@ProviderFor(PaymentController)
final paymentControllerProvider =
    AutoDisposeNotifierProvider<PaymentController, PaymentState>.internal(
      PaymentController.new,
      name: r'paymentControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$paymentControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$PaymentController = AutoDisposeNotifier<PaymentState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

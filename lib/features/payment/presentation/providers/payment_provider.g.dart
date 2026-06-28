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
String _$paymentControllerHash() => r'7b72814bd2965dce3ebabf5f184f3baa9e583c0c';

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

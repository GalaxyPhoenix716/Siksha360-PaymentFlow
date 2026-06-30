import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:siksha360_task/core/constants/route_names.dart';
import 'package:siksha360_task/features/payment/presentation/providers/payment_provider.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SlideToPay extends ConsumerWidget {
  final TextTheme textTheme;
  final ColorScheme colorScheme;
  final String receiverName;
  final String receiverType;
  final double amount;

  const SlideToPay({
    super.key,
    required this.textTheme,
    required this.colorScheme,
    required this.receiverName,
    required this.receiverType,
    required this.amount,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SlideAction(
      text: 'Slide to Pay',
      textStyle: textTheme.titleLarge?.copyWith(color: colorScheme.onPrimary),
      borderRadius: 20,
      outerColor: colorScheme.primary,
      innerColor: colorScheme.onPrimary,
      elevation: 0,
      onSubmit: () async {
        try {
          final success = await ref
              .read(paymentControllerProvider.notifier)
              .processPayment(
                receiverName: receiverName,
                receiverType: receiverType,
                amount: amount,
              );

          if (!context.mounted) return;

          if (success) {
            context.pushNamed(RouteNames.paymentCompletedRouteName);
          } else {
            final state = ref.read(paymentControllerProvider);
            final errorMsg =
                state.validationError ?? state.errorMessage ?? 'Payment failed';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMsg),
                backgroundColor: colorScheme.error,
              ),
            );
          }
        } catch (e) {
          if (!context.mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.toString()),
              backgroundColor: colorScheme.error,
            ),
          );
        }
      },
      submittedIcon: SpinKitCircle(color: colorScheme.onPrimary, size: 35),
    );
  }
}

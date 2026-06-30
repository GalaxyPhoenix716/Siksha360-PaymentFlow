import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:siksha360_task/features/payment/domain/entities/payment_method.dart';
import 'package:siksha360_task/features/payment/presentation/providers/payment_provider.dart';

class PaymentModeSelector extends ConsumerWidget {
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const PaymentModeSelector({
    super.key,
    required this.textTheme,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMethod = ref.watch(
      paymentControllerProvider.select((s) => s.selectedMethod),
    );

    return Column(
      children: [
        _buildMethodCard(
          method: PaymentMethod.creditCard,
          assetPath: 'assets/icons/credit-card-filled.svg',
          isSelected: selectedMethod == PaymentMethod.creditCard,
          onTap: () => ref
              .read(paymentControllerProvider.notifier)
              .selectPaymentMethod(PaymentMethod.creditCard),
        ),
        _buildMethodCard(
          method: PaymentMethod.upi,
          assetPath: 'assets/icons/upi.svg',
          isSelected: selectedMethod == PaymentMethod.upi,
          onTap: () => ref
              .read(paymentControllerProvider.notifier)
              .selectPaymentMethod(PaymentMethod.upi),
        ),
        _buildMethodCard(
          method: PaymentMethod.netBanking,
          assetPath: 'assets/icons/bank-filled.svg',
          isSelected: selectedMethod == PaymentMethod.netBanking,
          onTap: () => ref
              .read(paymentControllerProvider.notifier)
              .selectPaymentMethod(PaymentMethod.netBanking),
        ),
      ],
    );
  }

  Widget _buildMethodCard({
    required PaymentMethod method,
    required String assetPath,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primary.withValues(alpha: 0.04)
              : colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? colorScheme.primary
                : colorScheme.onSurface.withValues(alpha: 0.06),
            width: isSelected ? 1.8 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: colorScheme.onSurface.withValues(
                alpha: isSelected ? 0.02 : 0.03,
              ),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected
                    ? colorScheme.primary.withValues(alpha: 0.1)
                    : colorScheme.onSurface.withValues(alpha: 0.04),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                assetPath,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  isSelected ? colorScheme.primary : colorScheme.onSurface,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Text(
              method.label,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: colorScheme.onSurface,
              ),
            ),
            const Spacer(),
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? colorScheme.primary
                      : colorScheme.onSurface.withValues(alpha: 0.2),
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

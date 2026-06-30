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
    final paymentState = ref.watch(paymentControllerProvider);
    final selectedMethod = paymentState.selectedMethod;

    return Column(
      children: [
        _buildMethodCard(
          method: PaymentMethod.upi,
          assetPath: 'assets/icons/upi.svg',
          isSelected: selectedMethod == PaymentMethod.upi,
          onTap: () => ref
              .read(paymentControllerProvider.notifier)
              .selectPaymentMethod(PaymentMethod.upi),
          expandedContent: _buildUpiContent(),
        ),
        _buildMethodCard(
          method: PaymentMethod.creditCard,
          assetPath: 'assets/icons/credit-card-filled.svg',
          isSelected: selectedMethod == PaymentMethod.creditCard,
          onTap: () => ref
              .read(paymentControllerProvider.notifier)
              .selectPaymentMethod(PaymentMethod.creditCard),
          expandedContent: _buildCardContent(),
        ),
        _buildMethodCard(
          method: PaymentMethod.netBanking,
          assetPath: 'assets/icons/bank-filled.svg',
          isSelected: selectedMethod == PaymentMethod.netBanking,
          onTap: () => ref
              .read(paymentControllerProvider.notifier)
              .selectPaymentMethod(PaymentMethod.netBanking),
          expandedContent: _buildNetBankingContent(),
        ),
      ],
    );
  }

  Widget _buildMethodCard({
    required PaymentMethod method,
    required String assetPath,
    required bool isSelected,
    required VoidCallback onTap,
    required Widget expandedContent,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected
              ? colorScheme.primary
              : colorScheme.onSurface.withValues(alpha: 0.06),
          width: isSelected ? 1.8 : 1.0,
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
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
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
                        isSelected
                            ? colorScheme.primary
                            : colorScheme.onSurface,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    method.label,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.w500,
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
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            child: isSelected
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 20,
                    ),
                    child: expandedContent,
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildUpiContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: colorScheme.onSurface.withValues(alpha: 0.06)),
        const SizedBox(height: 12),
        Text(
          'Enter UPI ID',
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
          decoration: BoxDecoration(
            color: colorScheme.onSurface.withValues(alpha: 0.04),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: colorScheme.onSurface.withValues(alpha: 0.08),
            ),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'username@okaxis',
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCardContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: colorScheme.onSurface.withValues(alpha: 0.06)),
        const SizedBox(height: 12),
        Text(
          'Card Details',
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
          decoration: BoxDecoration(
            color: colorScheme.onSurface.withValues(alpha: 0.04),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: colorScheme.onSurface.withValues(alpha: 0.08),
            ),
          ),
          child: const TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: '0000 0000 0000 0000',
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.onSurface.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: colorScheme.onSurface.withValues(alpha: 0.08),
                  ),
                ),
                child: const TextField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    hintText: 'MM/YY',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.onSurface.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: colorScheme.onSurface.withValues(alpha: 0.08),
                  ),
                ),
                child: const TextField(
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'CVV',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNetBankingContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: colorScheme.onSurface.withValues(alpha: 0.06)),
        const SizedBox(height: 12),
        Text(
          'Popular Banks',
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildBankButton('HDFC'),
            const SizedBox(width: 8),
            _buildBankButton('SBI'),
            const SizedBox(width: 8),
            _buildBankButton('ICICI'),
            const SizedBox(width: 8),
            _buildBankButton('Axis'),
          ],
        ),
      ],
    );
  }

  Widget _buildBankButton(String name) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: colorScheme.onSurface.withValues(alpha: 0.04),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: colorScheme.onSurface.withValues(alpha: 0.08),
          ),
        ),
        child: Center(
          child: Text(
            name,
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}

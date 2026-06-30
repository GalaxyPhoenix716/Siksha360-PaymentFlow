import 'package:flutter/material.dart';
import 'package:siksha360_task/features/home/domain/entities/student_fee.dart';
import 'package:siksha360_task/features/payment/presentation/widgets/fee_summary_card.dart';
import 'package:siksha360_task/shared/siksha_appbar.dart';

class PaymentPage extends StatelessWidget {
  final StudentFee studentFee;

  const PaymentPage({super.key, required this.studentFee});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextTheme textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SikshaAppbar(),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FeeSummaryCard(
                    colorScheme: colorScheme,
                    studentFee: studentFee,
                    textTheme: textTheme,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

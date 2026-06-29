import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siksha360_task/core/constants/colors.dart';
import 'package:siksha360_task/features/home/presentation/providers/home_provider.dart';
import 'package:siksha360_task/features/home/presentation/widgets/fee_card.dart';
import 'package:siksha360_task/shared/siksha_appbar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: homeState.when(
        data: (user) => CustomScrollView(
          slivers: [
            SikshaAppbar(),

            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Hello ${user.name}'),

                  const Spacer(),

                  Container(
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(),
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('NOTICE'),
                      const Icon(
                        Icons.push_pin_outlined,
                        color: AppColors.primaryDark,
                      ),
                    ],
                  ),

                  const Spacer(),

                  FeeCard(
                    schoolName: user.children[0].service,
                    classGrade: user.children[0].grade,
                    feeAmount: user.children[0].fee,
                    onPayPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
        error: (e, st) => const SizedBox(),
        loading: () => const SizedBox(),
      ),
    );
  }
}

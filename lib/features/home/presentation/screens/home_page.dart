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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Hello ${user.name}'),
                
                    const SizedBox(height: 16.0),
                
                    Container(
                      padding: const EdgeInsets.all(8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(),
                    ),
                
                    const SizedBox(height: 24.0),
                
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
                
                    const SizedBox(height: 16.0),
                
                    FeeCard(student: user.children[0]),
                  ],
                ),
              ),
            ),
          ],
        ),
        error: (e, st) => Text(e.toString()),
        loading: () => const SizedBox(),
      ),
    );
  }
}

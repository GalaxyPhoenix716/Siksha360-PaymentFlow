import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siksha360_task/features/home/presentation/providers/home_provider.dart';
import 'package:siksha360_task/features/home/presentation/widgets/fee_card.dart';
import 'package:siksha360_task/shared/siksha_appbar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeProvider);

    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextTheme textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: homeState.when(
        data: (user) => CustomScrollView(
          slivers: [
            SikshaAppbar(),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, ${user.name}',
                      style: textTheme.headlineMedium,
                    ),

                    const SizedBox(height: 16.0),

                    Container(
                      padding: const EdgeInsets.all(8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: colorScheme.surface,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(),
                    ),

                    const SizedBox(height: 24.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('NOTICE'),
                        Icon(
                          Icons.push_pin_outlined,
                          color: colorScheme.onSurface,
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

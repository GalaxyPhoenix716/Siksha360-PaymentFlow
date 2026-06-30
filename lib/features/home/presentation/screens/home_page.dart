import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:siksha360_task/features/home/presentation/providers/home_provider.dart';
import 'package:siksha360_task/features/home/presentation/widgets/child_info_card.dart';
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

                    ChildInfoCard(
                      user: user,
                      colorScheme: colorScheme,
                      textTheme: textTheme,
                    ),

                    const SizedBox(height: 12),

                    Divider(color: colorScheme.secondary),

                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('NOTICE', style: textTheme.titleLarge),

                        Transform.rotate(
                          angle: 0.523599, //30 degress in radians
                          child: SvgPicture.asset(
                            'assets/icons/pin-filled.svg',
                            width: 24,
                            height: 24,
                            semanticsLabel: 'Arrow Up Right Icon',
                            colorFilter: ColorFilter.mode(
                              theme.colorScheme.onSurface,
                              BlendMode.srcIn,
                            ),
                          ),
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

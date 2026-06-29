import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siksha360_task/features/home/presentation/providers/home_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeProvider);

    return Scaffold(
      body: homeState.when(
        data: (user) => CustomScrollView(
          slivers: [
            AppBar()
          ],
        ),
        error: (e, st) => const SizedBox(),
        loading: () => const SizedBox(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:siksha360_task/core/constants/colors.dart';

class SikshaAppbar extends StatelessWidget {
  const SikshaAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.background,
      surfaceTintColor: AppColors.background,
      pinned: true,
      leading: const Text('Siksha360'),
      actions: [
        Stack(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: AppColors.primaryAccent,
              child: Icon(Icons.person, color: Colors.white, size: 25),
            ),
            Positioned(
              right: 5,
              top: -3,
              child: CircleAvatar(
                radius: 28,
                backgroundColor: AppColors.background,
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.primaryDark,
                ),
              ),
            ),
            const SizedBox(width: 100),
          ],
        ),
      ],
    );
  }
}

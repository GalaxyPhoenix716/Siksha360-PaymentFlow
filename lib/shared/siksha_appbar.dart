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
      // leading: const Text('Siksha360', maxLines: 1,overflow: TextOverflow.ellipsis,),
      actions: [
        Stack(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.primaryAccent,
              child: Icon(Icons.person, color: Colors.white, size: 25),
            ),
            Positioned(
              right: 25,
              top: -2,
              child: CircleAvatar(
                radius: 22,
                backgroundColor: AppColors.background,
                child: CircleAvatar(
                  radius: 20,
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

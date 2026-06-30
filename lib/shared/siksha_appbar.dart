import 'package:flutter/material.dart';

class SikshaAppbar extends StatelessWidget {
  const SikshaAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return SliverAppBar(
      backgroundColor: theme.scaffoldBackgroundColor,
      surfaceTintColor: theme.scaffoldBackgroundColor,
      pinned: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Siksha360',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
        ),
      ),
      leadingWidth: 140.0,
      actions: [
        Stack(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: colorScheme.primary,
              child: Icon(
                Icons.person_outline,
                color: colorScheme.onPrimary,
                size: 22,
              ),
            ),
            Positioned(
              right: 25,
              top: -2,
              child: CircleAvatar(
                radius: 22,
                backgroundColor: theme.scaffoldBackgroundColor,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: colorScheme.onSurface,
                  child: Text(
                    'AS',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: theme.scaffoldBackgroundColor,
                    ),
                  ),
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

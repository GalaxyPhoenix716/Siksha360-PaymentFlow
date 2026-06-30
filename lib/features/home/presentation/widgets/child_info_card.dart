import 'package:flutter/material.dart';
import 'package:siksha360_task/features/home/domain/entities/parent.dart';

class ChildInfoCard extends StatelessWidget {
  const ChildInfoCard({
    super.key,
    required this.user,
    required this.colorScheme,
    required this.textTheme,
  });

  final Parent user;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          colors: [
            colorScheme.primaryContainer,
            colorScheme.secondaryContainer,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.06),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Child Info',
            style: textTheme.bodyLarge?.copyWith(
              color: colorScheme.onPrimary.withValues(alpha: 0.6),
            ),
          ),

          const SizedBox(height: 10),

          Text(
            user.children[0].studentName,
            style: textTheme.headlineLarge?.copyWith(
              color: colorScheme.onPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            'Class ${user.children[0].grade}',
            style: textTheme.titleLarge?.copyWith(
              color: colorScheme.onPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

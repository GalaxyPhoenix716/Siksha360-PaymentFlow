import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:siksha360_task/core/constants/route_names.dart';
import 'package:siksha360_task/core/utils/utils.dart';
import 'package:siksha360_task/features/home/domain/entities/student_fee.dart';

class FeeCard extends StatelessWidget {
  final StudentFee student;

  const FeeCard({super.key, required this.student});

  void onPayPressed(BuildContext context) {
    context.pushNamed(RouteNames.paymentRouteName, extra: student);
  }

  @override
  Widget build(BuildContext context) {
    const double notchWidth = 130;
    const double notchHeight = 58;
    const double gap = 10;
    const double margin = gap / 2;

    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextTheme textTheme = theme.textTheme;

    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: _NotchedCardPainter(
                r: 28.0,
                cr: 20.0,
                ir: 20.0,
                cutoutW: notchWidth,
                cutoutH: notchHeight,
                backgroundColor: colorScheme.surface,
                borderColor: colorScheme.onSurface.withValues(alpha: 0.06),
                shadowColor: colorScheme.onSurface.withValues(alpha: 0.04),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'FEE DUE',
                      style: textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Tooltip(
                      message: 'Fee Breakdown',
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: colorScheme.onSurface,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.apartment, color: colorScheme.onSurface),
                    const SizedBox(width: 15),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          student.serviceName,
                          style: textTheme.headlineMedium,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Class ${student.grade} • II Quarter 2026-27',
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 24), // Replaced Spacer with fixed height
                Text(
                  '₹${NumberFormatter.format(student.fee)}',
                  style: textTheme.headlineLarge?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: margin,
            right: margin,
            child: SizedBox(
              width: notchWidth - gap,
              height: notchHeight - gap,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () => onPayPressed(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pay',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 10),
                    SvgPicture.asset(
                      'assets/icons/arrow-up-right.svg',
                      width: 24,
                      height: 24,
                      semanticsLabel: 'Arrow Up Right Icon',
                      colorFilter: ColorFilter.mode(
                        colorScheme.onPrimary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NotchedCardPainter extends CustomPainter {
  final double r;
  final double cr;
  final double ir;
  final double cutoutW;
  final double cutoutH;
  final Color backgroundColor;
  final Color borderColor;
  final Color shadowColor;

  const _NotchedCardPainter({
    required this.r,
    required this.cr,
    required this.ir,
    required this.cutoutW,
    required this.cutoutH,
    required this.backgroundColor,
    required this.borderColor,
    required this.shadowColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final path = Path()
      ..moveTo(r, 0)
      ..lineTo(w - r, 0)
      ..quadraticBezierTo(w, 0, w, r)
      ..lineTo(w, h - cutoutH - cr)
      ..quadraticBezierTo(w, h - cutoutH, w - cr, h - cutoutH)
      ..lineTo(w - cutoutW + ir, h - cutoutH)
      ..quadraticBezierTo(
        w - cutoutW,
        h - cutoutH,
        w - cutoutW,
        h - cutoutH + ir,
      )
      ..lineTo(w - cutoutW, h - cr)
      ..quadraticBezierTo(w - cutoutW, h, w - cutoutW - cr, h)
      ..lineTo(r, h)
      ..quadraticBezierTo(0, h, 0, h - r)
      ..lineTo(0, r)
      ..quadraticBezierTo(0, 0, r, 0)
      ..close();

    final shadowPaint = Paint()
      ..color = shadowColor
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12.0);
    canvas.drawPath(path, shadowPaint);

    final bgPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, bgPaint);

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant _NotchedCardPainter oldDelegate) =>
      oldDelegate.backgroundColor != backgroundColor ||
      oldDelegate.borderColor != borderColor ||
      oldDelegate.shadowColor != shadowColor;
}

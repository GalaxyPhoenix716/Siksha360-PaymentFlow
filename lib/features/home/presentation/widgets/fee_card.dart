import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:siksha360_task/core/constants/colors.dart';
import 'package:siksha360_task/core/constants/route_names.dart';
import 'package:siksha360_task/features/home/domain/entities/student_fee.dart';

class FeeCard extends StatelessWidget {
  final StudentFee student;

  const FeeCard({super.key, required this.student});

  void onPayPressed(BuildContext context) {
    context.pushNamed(RouteNames.paymentRouteName, extra: student);
  }

  @override
  Widget build(BuildContext context) {
    const double notchWidth = 150.0;
    const double notchHeight = 58.0;
    const double gap = 8.0;
    const double margin = gap / 2;

    return SizedBox(
      height: 180,
      width: double.infinity,
      child: Stack(
        children: [
          ClipPath(
            clipper: const _NotchedCardClipper(
              r: 28.0,
              cr: 20.0,
              ir: 20.0,
              cutoutW: notchWidth,
              cutoutH: notchHeight,
            ),
            child: Container(
              color: const Color(0xFFD9D9D9),
              padding: const EdgeInsets.all(24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          student.serviceName,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            height: 1.1,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          student.grade,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '${student.fee}',
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryAccent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          ),

          //pay button
          Positioned(
            bottom: margin,
            right: margin,
            child: SizedBox(
              width: notchWidth - gap,
              height: notchHeight - gap,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryAccent,
                  foregroundColor: AppColors.card,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () => onPayPressed(context),
                child: Row(
                  children: [
                    const Text(
                      'Pay',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
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

class _NotchedCardClipper extends CustomClipper<Path> {
  final double r;
  final double cr;
  final double ir;
  final double cutoutW;
  final double cutoutH;

  const _NotchedCardClipper({
    required this.r,
    required this.cr,
    required this.ir,
    required this.cutoutW,
    required this.cutoutH,
  });

  @override
  Path getClip(Size size) {
    final path = Path();
    final w = size.width;
    final h = size.height;

    path.moveTo(r, 0);
    path.lineTo(w - r, 0);
    path.quadraticBezierTo(w, 0, w, r);
    path.lineTo(w, h - cutoutH - cr);
    path.quadraticBezierTo(w, h - cutoutH, w - cr, h - cutoutH);
    path.lineTo(w - cutoutW + ir, isNotched(h - cutoutH));
    path.quadraticBezierTo(
      w - cutoutW,
      h - cutoutH,
      w - cutoutW,
      h - cutoutH + ir,
    );
    path.lineTo(w - cutoutW, h - cr);
    path.quadraticBezierTo(w - cutoutW, h, w - cutoutW - cr, h);
    path.lineTo(r, h);
    path.quadraticBezierTo(0, h, 0, h - r);
    path.lineTo(0, r);
    path.quadraticBezierTo(0, 0, r, 0);
    path.close();
    return path;
  }

  double isNotched(double y) => y;

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

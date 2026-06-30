import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:siksha360_task/core/constants/route_names.dart';
import 'package:siksha360_task/features/home/domain/entities/student_fee.dart';
import 'package:siksha360_task/features/home/presentation/screens/home_page.dart';
import 'package:siksha360_task/features/payment/presentation/screens/payment_completed_page.dart';
import 'package:siksha360_task/features/payment/presentation/screens/payment_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: RouteNames.homeRouteName,
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        name: RouteNames.paymentRouteName,
        path: '/${RouteNames.paymentRouteName}',
        builder: (context, state) {
          final studentFee = state.extra as StudentFee;
          return PaymentPage(studentFee: studentFee);
        },
      ),
      GoRoute(
        name: RouteNames.paymentCompletedRouteName,
        path: '/${RouteNames.paymentCompletedRouteName}',

        builder: (context, state) {
          return PaymentCompletedPage();
        },
      ),
    ],
  );
});

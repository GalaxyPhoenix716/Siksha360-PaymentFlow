import 'package:go_router/go_router.dart';
import 'package:siksha360_task/core/constants/route_names.dart';
import 'package:siksha360_task/features/home/presentation/screens/home_page.dart';
import 'package:siksha360_task/features/payment/presentation/screens/payment_completed_page.dart';
import 'package:siksha360_task/features/payment/presentation/screens/payment_page.dart';

class AppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: RouteNames.homeRouteName,
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        name: RouteNames.paymentRouteName,
        path: '/${RouteNames.paymentRouteName}',
        builder: (context, state) => PaymentPage(),
      ),
      GoRoute(
        name: RouteNames.paymentCompletedRouteName,
        path: '/${RouteNames.paymentCompletedRouteName}',
        builder: (context, state) => PaymentCompletedPage(),
      ),
    ],
  );
}

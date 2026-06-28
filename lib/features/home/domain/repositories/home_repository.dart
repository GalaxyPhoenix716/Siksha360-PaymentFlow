import 'package:siksha360_task/features/home/domain/entities/parent.dart';

abstract class HomeRepository {
  Future<Parent> fetchUser();
}

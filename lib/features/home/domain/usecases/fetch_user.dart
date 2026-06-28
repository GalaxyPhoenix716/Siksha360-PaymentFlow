import 'package:siksha360_task/core/error/failures.dart';
import 'package:siksha360_task/features/home/domain/entities/parent.dart';
import 'package:siksha360_task/features/home/domain/repositories/home_repository.dart';

class FetchUserUseCase {
  final HomeRepository repository;

  const FetchUserUseCase(this.repository);

  Future<Parent> execute() async {
    try {
      return await repository.fetchUser();
    } catch (e) {
      throw const ServerFailure(message: 'Failed to fetch user');
    }
  }
}
